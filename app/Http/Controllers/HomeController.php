<?php

namespace App\Http\Controllers;

use App\Absensi;
use App\UserInfo;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;

class HomeController extends Controller
{
    public function index(Request $request)
    {
        if ($request->method() === 'POST') {
            $status = $request->status;
            $tanggal = $request->tanggal;

            $data = Absensi::query()
                ->with(['userinfo' => function ($e) {
                    $e->select('userid', 'name');
                }])
                ->where('checktype', $status)
                ->whereBetween('checktime', [$tanggal . ' 00:00:00', $tanggal . ' 23:59:59'])
                ->get();

            return DataTables::of($data)
                ->editColumn('checktime', function ($e) {
                    return Carbon::parse($e->checktime)->isoFormat('HH:mm:ss');
                })
                ->make(true);
        }

        return view('backend.dashboard');
    }

    public function laporan(Request $request)
    {
        if ($request->method() === 'POST') {
            $tanggal = $request->tanggal;
            if(preg_match('/to/i', $tanggal)){
                $pecah = explode('to', $tanggal);


                $tmulai = trim($pecah[0]).' 00:00:00';
                $takhir = trim($pecah[1]).' 23:59:59';

            }else{
                $tmulai = $tanggal.' 00:00:00';
                $takhir = $tanggal.' 23:59:59';
            }

            $sql = "
            with
            hari_kerja as (
                select
                    a.userid,
                    d.`year`,
                    d.`month`,
                    d.working_day
                from userinfo a
                    join ad_user_mapping b on b.user_id = a.userid
                    join ad_group_employe c on c.id = b.group_employe_id
                    join ad_working_day d on d.group_employe_id = c.id
                where
                    d.`year` = '2023' and
                    d.`month` = '01'
            ),

            kehadiran as (
                select
                    a.userid,
                    sum(a.hk) as kehadiran
                from (
                    select
                        a.userid,
                        count(distinct a.userid) as hk,
                        a.checktime
                    from checkinout a
                    where
                        (a.checktime between '".$tmulai."' and '".$takhir."')
                    group by a.userid, date(a.checktime)
                ) a
                group by a.userid
            ),

            total_checkin as (
                select
                    a.userid,
                    a.tanggal,
                    a.masuk,
                    a.keluar,
                    a.check_in,
                    a.check_out,
                    a.toleransi_checkin,
                    case when a.masuk <> '0' and time_to_sec(a.check_in) > time_to_sec(time(a.masuk))
                         then 1 else 0 end as early,
                    case when time_to_sec(a.check_in) <= time_to_sec(time(a.masuk)) and time_to_sec(a.toleransi_checkin) >= time_to_sec(time(a.masuk)) and a.masuk <> '0'
                         then 1 else 0 end as ontime,
                    case when time_to_sec(a.toleransi_checkin) < time_to_sec(time(a.masuk))
                         then 1 else 0 end as late_ci,
                    case when time_to_sec(a.check_out) > time_to_sec(time(a.keluar)) and a.keluar <> '0'
                         then 1 else 0 end as early_co,
                    case when a.masuk <> '0'
                         then abs(round(time_to_sec(a.check_in) - time_to_sec(a.masuk))) else 0 end as selisih,
                    case when a.keluar <> '0'
                         then abs(round(time_to_sec(a.check_out) - time_to_sec(a.keluar))) else 0 end as selisih_ot
                from (
                    select
                        a.userid,
                        date(a.checktime) as tanggal,
                        max(if(a.checktype = 'I', time(a.checktime), 0)) as masuk,
                        max(if(a.checktype = 'O', time(a.checktime), 0)) as keluar,
                        a.check_in,
                        a.check_out,
                        a.toleransi_checkin
                    from (
                        select
                            a.userid,
                            a.checktype,
                            min(a.checktime) as checktime,
                            d.check_in,
                            d.check_out,
                            sec_to_time(time_to_sec(d.check_in) + (select check_in * 60 from ad_grace_inperiod gg)) as toleransi_checkin,
                            d.ot_in,
                            b.*
                        from checkinout a
                            left join ad_user_mapping b on b.user_id = a.userid
                            left join ad_group_employe c on c.id = b.group_employe_id
                            left join ad_shift d on d.id = c.shift_id
                        where
                            (a.checktime between '".$tmulai."' and '".$takhir."')
                        group by a.userid, date(a.checktime), a.checktype
                    ) a
                    group by a.userid, date(a.checktime)
                ) a
            ),

            hitung_checkin as (
                select
                    a.userid,
                    sum(a.early) as early,
                    sum(a.ontime) as ontime,
                    sum(a.late_ci) as late_ci,
                    sum(a.early_co) as early_co,
                    sec_to_time(sum(a.selisih)) as selisih,
                    sec_to_time(sum(a.selisih_ot)) as selisih_ot
                from total_checkin a
                group by a.userid
            ),

            tidak_absen as (
                select
                    a.userid,
                    sum(a.check_in) as check_in,
                    sum(a.check_out) as check_out
                from (
                    select
                        a.userid,
                        a.tanggal,
                        max(if(a.checktype = 'I', 1, 0)) as check_in,
                        max(if(a.checktype = 'O', 1, 0)) as check_out
                    from (
                        select
                            a.userid,
                            date(a.checktime) as tanggal,
                            a.checktype
                        from checkinout a
                        where (a.checktime between '2022-11-21 00:00:00' and '2022-12-20 23:59:59')
                        group by a.userid, date(a.checktime), a.checktype
                    ) a
                    group by a.userid, a.tanggal
                ) a
                group by a.userid
            )

            select
                a.userid,
                a.name,
                c.working_day,
                coalesce(b.kehadiran, 0) as kehadiran,
                c.working_day - coalesce(b.kehadiran, 0) as tidak_masuk,
                coalesce(d.early, 0) as early,
                coalesce(d.ontime, 0) as ontime,
                coalesce(d.late_ci, 0) as late_ci,
                coalesce(d.early_co, 0) as early_co,
                case when d.selisih is null then '-'
                     when hour(d.selisih) = '0' then '-'
                     else concat(hour(d.selisih),'. ',minute(d.selisih))
                end as selisih,
                case when d.selisih_ot is null then '-'
                     when hour(d.selisih_ot) = '0' then '-'
                     else concat(hour(d.selisih_ot),'. ',minute(d.selisih_ot))
                 end as selisih_ot,
                (coalesce(b.kehadiran, 0) - coalesce(e.check_in, 0)) as tidak_checkin,
                (coalesce(b.kehadiran, 0) - coalesce(e.check_out, 0)) as tidak_checkout
            from userinfo a
                left join kehadiran b on b.userid = a.userid
                join hari_kerja c on c.userid = a.userid
                left join hitung_checkin d on d.userid = a.userid
                left join tidak_absen e on e.userid = a.userid
            ";

            $data = DB::select($sql);

            return DataTables::of($data)
                ->make();
        }
        return view('backend.laporan');
    }
}
