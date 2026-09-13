-- ==============================================================================
-- CONICCLASSROOM - SUPABASE DATABASE SCHEMA & RLS POLICIES
-- Dự án: Quản lý lớp học thông minh THPT Nguyễn Hữu Cảnh
-- Hỗ trợ: Đăng nhập Gmail, Phân quyền Thầy giáo vs Lớp trưởng, Realtime & Multi-Year
-- ==============================================================================

-- 1. BẢNG NĂM HỌC (ACADEMIC YEARS)
create table if not exists public.academic_years (
    id text primary key, -- vd: '2026-2027'
    name text not null,  -- vd: 'Năm học 2026 - 2027'
    is_active boolean default true,
    created_at timestamptz default now()
);

-- 2. BẢNG LỚP HỌC (CLASSES)
create table if not exists public.classes (
    id text primary key, -- vd: 'class_12c13' hoặc '12c13_2026'
    year_id text references public.academic_years(id) on delete cascade,
    name text not null,  -- vd: 'Lớp 12C13'
    teacher_email text default 'nguyensangnhc@gmail.com',
    monitor_email text,  -- Email Gmail của Lớp trưởng (vd: 'phuongnhi12c13@gmail.com')
    created_at timestamptz default now()
);

-- 3. BẢNG HỌC SINH (STUDENTS)
create table if not exists public.students (
    id text primary key, -- vd: '12c13_1'
    class_id text references public.classes(id) on delete cascade,
    stt integer not null,
    sbd text,
    name text not null,
    gender text default 'Nam',
    dob text,
    ethnic text default 'Kinh',
    team integer default 1,
    points numeric default 10,
    dgtx1 numeric default 8.0,
    dgtx2 numeric default 8.0,
    dgtx3 numeric default 8.0,
    dgtx4 numeric default 8.0,
    dgtx5 numeric default 8.0,
    attitude numeric default 10,
    giua_ky numeric default 8.0,
    cuoi_ky numeric default 8.0,
    created_at timestamptz default now(),
    updated_at timestamptz default now()
);

-- 4. BẢNG LỊCH SỬ CỘNG/TRỪ ĐIỂM (POINT LOGS)
create table if not exists public.point_logs (
    id uuid default gen_random_uuid() primary key,
    student_id text references public.students(id) on delete cascade,
    class_id text references public.classes(id) on delete cascade,
    points numeric not null,
    reason text not null,
    actor_email text, -- Email của người bấm (+/-)
    semester text default 'hk1', -- 'hk1' hoặc 'hk2'
    created_at timestamptz default now()
);

alter table public.point_logs add column if not exists semester text default 'hk1';

-- ==============================================================================
-- HÀM TỰ ĐỘNG DỌN DẸP DỮ LIỆU > 1 NĂM (BẢO TOÀN DUNG LƯỢNG MIỄN PHÍ VĨNH VIỄN)
-- Đảm bảo dung lượng DB luôn dưới 5 MB (< 1% của hạn mức 500 MB Supabase Free Tier)
-- ==============================================================================
create or replace function public.cleanup_point_logs_older_than_1_year()
returns integer
language plpgsql
security definer
as $
declare
    deleted_count integer;
begin
    delete from public.point_logs
    where created_at < now() - interval '1 year';
    get diagnostics deleted_count = row_count;
    return deleted_count;
end;
$;

-- BẬT ROW LEVEL SECURITY (RLS) TRÊN TẤT CẢ CÁC BẢNG
alter table public.academic_years enable row level security;
alter table public.classes enable row level security;
alter table public.students enable row level security;
alter table public.point_logs enable row level security;

-- ==============================================================================
-- RLS POLICIES (BẢO MẬT & PHÂN QUYỀN TẦNG DATABASE)
-- ==============================================================================

-- 1. ĐỌC DỮ LIỆU: Bất kỳ ai (Khách, Học sinh, Lớp trưởng, Thầy giáo) đều có thể xem
drop policy if exists "Allow Public Read Academic Years" on public.academic_years;
create policy "Allow Public Read Academic Years" on public.academic_years for select using (true);

drop policy if exists "Allow Public Read Classes" on public.classes;
create policy "Allow Public Read Classes" on public.classes for select using (true);

drop policy if exists "Allow Public Read Students" on public.students;
create policy "Allow Public Read Students" on public.students for select using (true);

drop policy if exists "Allow Public Read Point Logs" on public.point_logs;
create policy "Allow Public Read Point Logs" on public.point_logs for select using (true);

-- 2. TOÀN QUYỀN CHO GIÁO VIÊN / ADMIN (nguyensangnhc@gmail.com, sangbeau@gmail.com)
drop policy if exists "Admin Full Access Academic Years" on public.academic_years;
create policy "Admin Full Access Academic Years" on public.academic_years for all
using (
    auth.jwt()->>'email' in ('nguyensangnhc@gmail.com', 'sangbeau@gmail.com')
    or auth.jwt()->>'email' = (select teacher_email from public.classes where id = classes.id limit 1)
);

drop policy if exists "Admin Full Access Classes" on public.classes;
create policy "Admin Full Access Classes" on public.classes for all
using (
    auth.jwt()->>'email' in ('nguyensangnhc@gmail.com', 'sangbeau@gmail.com')
    or auth.jwt()->>'email' = teacher_email
);

drop policy if exists "Admin Full Access Students" on public.students;
create policy "Admin Full Access Students" on public.students for all
using (
    auth.jwt()->>'email' in ('nguyensangnhc@gmail.com', 'sangbeau@gmail.com')
    or auth.jwt()->>'email' in (select teacher_email from public.classes where id = students.class_id)
);

drop policy if exists "Admin Full Access Logs" on public.point_logs;
create policy "Admin Full Access Logs" on public.point_logs for all
using (
    auth.jwt()->>'email' in ('nguyensangnhc@gmail.com', 'sangbeau@gmail.com')
    or auth.jwt()->>'email' in (select teacher_email from public.classes where id = point_logs.class_id)
);

-- 3. QUYỀN CHO LỚP TRƯỞNG & BAN CÁN SỰ (CLASS MONITORS - HỖ TRỢ NHIỀU EMAIL)
-- Ban cán sự ĐƯỢC PHÉP cập nhật điểm (points) của học sinh trong ĐÚNG lớp của mình
drop policy if exists "Monitor Update Student Points" on public.students;
create policy "Monitor Update Student Points" on public.students for update
using (
    class_id in (
        select id from public.classes
        where lower(trim(auth.jwt()->>'email')) = any(string_to_array(lower(replace(coalesce(monitor_email, ''), ' ', '')), ','))
    )
)
with check (
    class_id in (
        select id from public.classes
        where lower(trim(auth.jwt()->>'email')) = any(string_to_array(lower(replace(coalesce(monitor_email, ''), ' ', '')), ','))
    )
);

-- Ban cán sự ĐƯỢC PHÉP ghi nhật ký điểm (insert point_logs) cho lớp mình
drop policy if exists "Monitor Insert Point Logs" on public.point_logs;
create policy "Monitor Insert Point Logs" on public.point_logs for insert
with check (
    class_id in (
        select id from public.classes
        where lower(trim(auth.jwt()->>'email')) = any(string_to_array(lower(replace(coalesce(monitor_email, ''), ' ', '')), ','))
    )
);

-- ==============================================================================
-- KÍCH HOẠT SUPABASE REALTIME (Tự động cập nhật tức thì trên các màn hình)
-- ==============================================================================
begin;
  -- Bật Realtime cho bảng students và point_logs
  alter publication supabase_realtime add table public.students;
  alter publication supabase_realtime add table public.point_logs;
  alter publication supabase_realtime add table public.classes;
commit;

-- ==============================================================================
-- DỮ LIỆU KHỞI TẠO (SEED DATA) NĂM HỌC 2026-2027 & CÁC LỚP 12
-- ==============================================================================

-- 1. Năm học
insert into public.academic_years (id, name, is_active)
values ('2026-2027', 'Năm học 2026 - 2027', true)
on conflict (id) do nothing;

-- 2. Các lớp học
insert into public.classes (id, year_id, name, teacher_email, monitor_email)
values 
('class_12c2', '2026-2027', 'Lớp 12C2', 'nguyensangnhc@gmail.com', null),
('class_12c13', '2026-2027', 'Lớp 12C13', 'nguyensangnhc@gmail.com', null)
on conflict (id) do nothing;

-- 3. Dữ liệu học sinh Lớp 12C2 (47 học sinh)
insert into public.students (id, class_id, stt, sbd, name, gender, dob, ethnic, team, points)
values
('12c2_1', 'class_12c2', 1, '120201', 'Võ Phạm Quốc An', 'Nam', '15/09/2009', 'Kinh', 1, 10),
('12c2_2', 'class_12c2', 2, '120202', 'Phan Huỳnh Anh', 'Nữ', '07/12/2009', 'Kinh', 2, 10),
('12c2_3', 'class_12c2', 3, '120203', 'Nguyễn Đức Bảo', 'Nam', '28/03/2009', 'Kinh', 3, 10),
('12c2_4', 'class_12c2', 4, '120204', 'Tần Gia Bảo', 'Nam', '16/11/2009', 'Kinh', 4, 10),
('12c2_5', 'class_12c2', 5, '120205', 'Trần Gia Bảo', 'Nam', '01/10/2009', 'Kinh', 1, 10),
('12c2_6', 'class_12c2', 6, '120206', 'Nguyễn Thị Mỹ Duyên', 'Nữ', '29/08/2009', 'Kinh', 2, 10),
('12c2_7', 'class_12c2', 7, '120207', 'Hoàng Phan Minh Đạt', 'Nam', '26/02/2009', 'Kinh', 3, 10),
('12c2_8', 'class_12c2', 8, '120208', 'Trần Minh Đạt', 'Nam', '08/08/2009', 'Kinh', 4, 10),
('12c2_9', 'class_12c2', 9, '120209', 'Trịnh Hoàng Đăng', 'Nam', '09/07/2009', 'Kinh', 1, 10),
('12c2_10', 'class_12c2', 10, '120210', 'Nguyễn Trần Đồng', 'Nam', '13/08/2009', 'Kinh', 2, 10),
('12c2_11', 'class_12c2', 11, '120211', 'Phạm Ngọc Trà Giang', 'Nữ', '03/04/2009', 'Kinh', 3, 10),
('12c2_12', 'class_12c2', 12, '120212', 'Đặng Thị Mỹ Hằng', 'Nữ', '17/11/2009', 'Kinh', 4, 10),
('12c2_13', 'class_12c2', 13, '120213', 'Nguyễn Thị Hiền', 'Nữ', '03/11/2009', 'Kinh', 1, 10),
('12c2_14', 'class_12c2', 14, '120214', 'Lê Thiện Khang Huy', 'Nam', '15/04/2009', 'Kinh', 2, 10),
('12c2_15', 'class_12c2', 15, '120215', 'Nguyễn Văn Ngọc Huy', 'Nam', '12/02/2009', 'Kinh', 3, 10),
('12c2_16', 'class_12c2', 16, '120216', 'Lê Thị Phương Huyền', 'Nữ', '06/10/2009', 'Kinh', 4, 10),
('12c2_17', 'class_12c2', 17, '120217', 'Phan Phú Hưng', 'Nam', '10/04/2009', 'Kinh', 1, 10),
('12c2_18', 'class_12c2', 18, '120218', 'Nguyễn Trung Kiên', 'Nam', '28/08/2009', 'Kinh', 2, 10),
('12c2_19', 'class_12c2', 19, '120219', 'Nguyễn Tuấn Kiệt', 'Nam', '08/02/2009', 'Kinh', 3, 10),
('12c2_20', 'class_12c2', 20, '120220', 'Trần Gia Kiệt', 'Nam', '05/11/2009', 'Kinh', 4, 10),
('12c2_21', 'class_12c2', 21, '120221', 'Hồng Quang Kiệt', 'Nam', '03/01/2009', 'Kinh', 1, 10),
('12c2_22', 'class_12c2', 22, '120222', 'Đặng Trần Gia Khánh', 'Nam', '01/10/2009', 'Kinh', 2, 10),
('12c2_23', 'class_12c2', 23, '120223', 'Trần Nguyễn Đăng Khoa', 'Nam', '26/06/2009', 'Kinh', 3, 10),
('12c2_24', 'class_12c2', 24, '120224', 'Hạng Đăng Khôi', 'Nam', '02/03/2009', 'Kinh', 4, 10),
('12c2_25', 'class_12c2', 25, '120225', 'Đào Quang Tùng Lâm', 'Nam', '19/10/2009', 'Kinh', 1, 10),
('12c2_26', 'class_12c2', 26, '120226', 'Đỗ Xuân Mai', 'Nữ', '04/01/2009', 'Kinh', 2, 10),
('12c2_27', 'class_12c2', 27, '120227', 'Trần Hoài Nam', 'Nam', '22/01/2009', 'Kinh', 3, 10),
('12c2_28', 'class_12c2', 28, '120228', 'Nguyễn Thị Thanh Ngân', 'Nữ', '03/02/2009', 'Kinh', 4, 10),
('12c2_29', 'class_12c2', 29, '120229', 'Huỳnh Bảo Ngọc', 'Nữ', '14/08/2009', 'Kinh', 1, 10),
('12c2_30', 'class_12c2', 30, '120230', 'Thi Tường Thảo Ngọc', 'Nữ', '06/06/2009', 'Kinh', 2, 10),
('12c2_31', 'class_12c2', 31, '120231', 'Võ Trần Bảo Ngọc', 'Nữ', '23/10/2009', 'Kinh', 3, 10),
('12c2_32', 'class_12c2', 32, '120232', 'Nguyễn Tường Thái Nguyên', 'Nam', '27/07/2009', 'Kinh', 4, 10),
('12c2_33', 'class_12c2', 33, '120233', 'Hoàng Nguyễn Bảo Như', 'Nữ', '15/01/2009', 'Kinh', 1, 10),
('12c2_34', 'class_12c2', 34, '120234', 'Lê Thị Kiều Oanh', 'Nữ', '11/03/2009', 'Kinh', 2, 10),
('12c2_35', 'class_12c2', 35, '120235', 'Trần Nguyễn Thiên Phú', 'Nam', '15/01/2009', 'Kinh', 3, 10),
('12c2_36', 'class_12c2', 36, '120236', 'Lý Hoàng Phúc', 'Nam', '28/02/2009', 'Kinh', 4, 10),
('12c2_37', 'class_12c2', 37, '120237', 'Vũ Bùi Hồng Phúc', 'Nam', '02/08/2009', 'Kinh', 1, 10),
('12c2_38', 'class_12c2', 38, '120238', 'Nguyễn Công Thành Tài', 'Nam', '23/04/2009', 'Kinh', 2, 10),
('12c2_39', 'class_12c2', 39, '120239', 'Võ Thành Tiến', 'Nam', '29/03/2009', 'Kinh', 3, 10),
('12c2_40', 'class_12c2', 40, '120240', 'Trần Đại Tín', 'Nam', '15/02/2009', 'Kinh', 4, 10),
('12c2_41', 'class_12c2', 41, '120241', 'Hồ Nguyễn Ngọc Tuyền', 'Nữ', '28/08/2009', 'Kinh', 1, 10),
('12c2_42', 'class_12c2', 42, '120242', 'Trần Ngọc Thanh Tuyền', 'Nữ', '01/11/2009', 'Kinh', 2, 10),
('12c2_43', 'class_12c2', 43, '120243', 'Lê Quang Thịnh', 'Nam', '20/12/2009', 'Kinh', 3, 10),
('12c2_44', 'class_12c2', 44, '120244', 'Huỳnh Thái Thuận', 'Nam', '18/05/2009', 'Kinh', 4, 10),
('12c2_45', 'class_12c2', 45, '120245', 'Lê Anh Thư', 'Nữ', '20/05/2009', 'Kinh', 1, 10),
('12c2_46', 'class_12c2', 46, '120246', 'Phan Tú Uyên', 'Nữ', '19/07/2009', 'Kinh', 2, 10),
('12c2_47', 'class_12c2', 47, '120247', 'Nguyễn Phương Vy', 'Nữ', '13/10/2009', 'Kinh', 3, 10)
on conflict (id) do update set 
  name = excluded.name,
  gender = excluded.gender,
  dob = excluded.dob,
  ethnic = excluded.ethnic,
  team = excluded.team;

-- 4. Dữ liệu học sinh Lớp 12C13 (40 học sinh)
insert into public.students (id, class_id, stt, sbd, name, gender, dob, ethnic, team, points)
values
('12c13_1', 'class_12c13', 1, '121301', 'Phạm Thị Thu An', 'Nữ', '08/11/2009', 'Kinh', 1, 10),
('12c13_2', 'class_12c13', 2, '121302', 'Nguyễn Tuấn Anh', 'Nam', '06/11/2009', 'Kinh', 2, 10),
('12c13_3', 'class_12c13', 3, '121303', 'Lương Phạm Minh Anh', 'Nữ', '10/10/2009', 'Kinh', 3, 10),
('12c13_4', 'class_12c13', 4, '121304', 'Phạm Quỳnh Anh', 'Nữ', '15/10/2009', 'Kinh', 4, 10),
('12c13_5', 'class_12c13', 5, '121305', 'Trần Nguyễn Hoàng Anh', 'Nam', '24/08/2009', 'Kinh', 1, 10),
('12c13_6', 'class_12c13', 6, '121306', 'Phan Lê Khánh Băng', 'Nữ', '20/03/2009', 'Kinh', 2, 10),
('12c13_7', 'class_12c13', 7, '121307', 'Lâm Ngọc Châu', 'Nữ', '18/02/2009', 'Hoa', 3, 10),
('12c13_8', 'class_12c13', 8, '121308', 'Võ Tấn Đạt', 'Nam', '28/01/2009', 'Kinh', 4, 10),
('12c13_9', 'class_12c13', 9, '121309', 'Đinh Xuân Định', 'Nam', '07/09/2009', 'Kinh', 1, 10),
('12c13_10', 'class_12c13', 10, '121310', 'Nguyễn Trường Giang', 'Nam', '20/07/2009', 'Kinh', 2, 10),
('12c13_11', 'class_12c13', 11, '121311', 'Lê Phúc Nguyên Hân', 'Nữ', '30/05/2009', 'Kinh', 3, 10),
('12c13_12', 'class_12c13', 12, '121312', 'Nguyễn Phạm Gia Hân', 'Nữ', '12/11/2009', 'Kinh', 4, 10),
('12c13_13', 'class_12c13', 13, '121313', 'Lê Thị Thanh Hoa', 'Nữ', '14/12/2009', 'Kinh', 1, 10),
('12c13_14', 'class_12c13', 14, '121314', 'Lê Khả Hùng', 'Nam', '13/10/2009', 'Kinh', 2, 10),
('12c13_15', 'class_12c13', 15, '121315', 'Lê Nguyễn Hoàng Lê', 'Nữ', '28/10/2009', 'Kinh', 3, 10),
('12c13_16', 'class_12c13', 16, '121316', 'Nguyễn Hoàng Mai Linh', 'Nữ', '06/07/2009', 'Kinh', 4, 10),
('12c13_17', 'class_12c13', 17, '121317', 'Lìu Khánh Luân', 'Nam', '17/03/2009', 'Hoa', 1, 10),
('12c13_18', 'class_12c13', 18, '121318', 'Vũ Hải Minh', 'Nam', '22/08/2009', 'Kinh', 2, 10),
('12c13_19', 'class_12c13', 19, '121319', 'Nguyễn Trần Khánh Ngân', 'Nữ', '26/08/2009', 'Kinh', 3, 10),
('12c13_20', 'class_12c13', 20, '121320', 'Du Gia Nghi', 'Nữ', '04/12/2009', 'Kinh', 4, 10),
('12c13_21', 'class_12c13', 21, '121321', 'Nguyễn Gia Nguyên', 'Nam', '29/01/2009', 'Kinh', 1, 10),
('12c13_22', 'class_12c13', 22, '121322', 'Trần Ngọc Thảo Nguyên', 'Nữ', '23/07/2009', 'Kinh', 2, 10),
('12c13_23', 'class_12c13', 23, '121323', 'Huỳnh Minh Nhật', 'Nam', '05/06/2008', 'Kinh', 3, 10),
('12c13_24', 'class_12c13', 24, '121324', 'Lê Phương Nhi', 'Nữ', '20/05/2009', 'Kinh', 4, 10),
('12c13_25', 'class_12c13', 25, '121325', 'Lê Uyên Nhi', 'Nữ', '07/02/2009', 'Kinh', 1, 10),
('12c13_26', 'class_12c13', 26, '121326', 'Đỗ Yến Như', 'Nữ', '28/06/2009', 'Kinh', 2, 10),
('12c13_27', 'class_12c13', 27, '121327', 'Dương Nguyễn Hồng Phúc', 'Nữ', '17/12/2009', 'Kinh', 3, 10),
('12c13_28', 'class_12c13', 28, '121328', 'Nguyễn Võ Trúc Phương', 'Nữ', '28/08/2009', 'Kinh', 4, 10),
('12c13_29', 'class_12c13', 29, '121329', 'Kim Ngọc Như Quỳnh', 'Nữ', '03/08/2009', 'Khơ-me', 1, 10),
('12c13_30', 'class_12c13', 30, '121330', 'Mang Triết Quỳnh', 'Nữ', '24/09/2009', 'Kinh', 2, 10),
('12c13_31', 'class_12c13', 31, '121331', 'Trần Thế Tài', 'Nam', '10/12/2009', 'Kinh', 3, 10),
('12c13_32', 'class_12c13', 32, '121332', 'Nguyễn Minh Thư', 'Nữ', '07/12/2009', 'Kinh', 4, 10),
('12c13_33', 'class_12c13', 33, '121333', 'Nguyễn Phan Bảo Thư', 'Nữ', '05/05/2009', 'Kinh', 1, 10),
('12c13_34', 'class_12c13', 34, '121334', 'Nguyễn Phan Bảo Thy', 'Nữ', '05/05/2009', 'Kinh', 2, 10),
('12c13_35', 'class_12c13', 35, '121335', 'Nguyễn Thị Thùy Tiên', 'Nữ', '17/01/2009', 'Kinh', 3, 10),
('12c13_36', 'class_12c13', 36, '121336', 'Ngô Xuân Trung', 'Nam', '14/09/2009', 'Kinh', 4, 10),
('12c13_37', 'class_12c13', 37, '121337', 'Trần Nguyễn Cẩm Tú', 'Nữ', '06/10/2009', 'Kinh', 1, 10),
('12c13_38', 'class_12c13', 38, '121338', 'Phạm Nhật Hà Uyên', 'Nữ', '15/09/2009', 'Kinh', 2, 10),
('12c13_39', 'class_12c13', 39, '121339', 'Nguyễn Trương Hải Vỹ', 'Nam', '02/10/2009', 'Kinh', 3, 10),
('12c13_40', 'class_12c13', 40, '121340', 'Lê Thị Thanh Xuân', 'Nữ', '02/03/2009', 'Kinh', 4, 10)
on conflict (id) do update set 
  name = excluded.name,
  gender = excluded.gender,
  dob = excluded.dob,
  ethnic = excluded.ethnic,
  team = excluded.team;
-- LỚP 10A8 (43 HỌC SINH)
insert into public.classes (id, year_id, name, teacher_email, monitor_email)
values ('class_10a8', '2026-2027', 'Lớp 10A8', 'nguyensangnhc@gmail.com', null)
on conflict (id) do nothing;

insert into public.students (id, class_id, stt, sbd, name, gender, dob, ethnic, team, points)
values
('10a8_1', 'class_10a8', 1, '100801', 'Bùi Nguyên Phúc Anh', 'Nam', '', 'Kinh', 1, 0),
('10a8_2', 'class_10a8', 2, '100802', 'Nguyễn Khoa Tuấn Anh', 'Nam', '', 'Kinh', 2, 0),
('10a8_3', 'class_10a8', 3, '100803', 'Võ Hoàng Phương Anh', 'Nữ', '', 'Kinh', 3, 0),
('10a8_4', 'class_10a8', 4, '100804', 'Nguyễn Thị Hồng Ánh', 'Nữ', '', 'Kinh', 4, 0),
('10a8_5', 'class_10a8', 5, '100805', 'Lê Quốc Bảo', 'Nam', '', 'Kinh', 1, 0),
('10a8_6', 'class_10a8', 6, '100806', 'Nguyễn Thị Bình', 'Nữ', '', 'Kinh', 2, 0),
('10a8_7', 'class_10a8', 7, '100807', 'Trương Thị Quế Chi', 'Nữ', '', 'Kinh', 3, 0),
('10a8_8', 'class_10a8', 8, '100808', 'Dương Bách Đăng', 'Nam', '', 'Kinh', 4, 0),
('10a8_9', 'class_10a8', 9, '100809', 'Nguyễn Văn Đức', 'Nam', '', 'Kinh', 1, 0),
('10a8_10', 'class_10a8', 10, '100810', 'Ngô Huy Dương', 'Nam', '', 'Kinh', 2, 0),
('10a8_11', 'class_10a8', 11, '100811', 'Hồ Võ Thế Duy', 'Nam', '', 'Kinh', 3, 0),
('10a8_12', 'class_10a8', 12, '100812', 'Võ Nguyễn Thị Duyên', 'Nữ', '', 'Kinh', 4, 0),
('10a8_13', 'class_10a8', 13, '100813', 'Hồ Ngọc Hân', 'Nữ', '', 'Kinh', 1, 0),
('10a8_14', 'class_10a8', 14, '100814', 'Võ Nhật Hảo', 'Nam', '', 'Kinh', 2, 0),
('10a8_15', 'class_10a8', 15, '100815', 'Nguyễn Hữu Hiền', 'Nam', '', 'Kinh', 3, 0),
('10a8_16', 'class_10a8', 16, '100816', 'Phan Nguyễn Trung Hiếu', 'Nam', '', 'Kinh', 4, 0),
('10a8_17', 'class_10a8', 17, '100817', 'Nguyễn Thành Hưng', 'Nam', '', 'Kinh', 1, 0),
('10a8_18', 'class_10a8', 18, '100818', 'Nguyễn Khang', 'Nam', '', 'Kinh', 2, 0),
('10a8_19', 'class_10a8', 19, '100819', 'Phạm Huỳnh Minh Khang', 'Nam', '', 'Kinh', 3, 0),
('10a8_20', 'class_10a8', 20, '100820', 'Trương Trọng Khang', 'Nam', '', 'Kinh', 4, 0),
('10a8_21', 'class_10a8', 21, '100821', 'Hoàng Gia Khánh', 'Nam', '', 'Kinh', 1, 0),
('10a8_22', 'class_10a8', 22, '100822', 'Nguyễn Văn Khoa', 'Nam', '', 'Kinh', 2, 0),
('10a8_23', 'class_10a8', 23, '100823', 'Bùi Lê Anh Kiệt', 'Nam', '', 'Kinh', 3, 0),
('10a8_24', 'class_10a8', 24, '100824', 'Lý Hoàng Kim', 'Nữ', '', 'Kinh', 4, 0),
('10a8_25', 'class_10a8', 25, '100825', 'Lý Nguyên Lâm', 'Nam', '', 'Kinh', 1, 0),
('10a8_26', 'class_10a8', 26, '100826', 'Đinh Ngọc Lan', 'Nữ', '', 'Kinh', 2, 0),
('10a8_27', 'class_10a8', 27, '100827', 'Huỳnh Ngọc Long', 'Nam', '', 'Kinh', 3, 0),
('10a8_28', 'class_10a8', 28, '100828', 'Trần Đức Tuệ Minh', 'Nữ', '', 'Kinh', 4, 0),
('10a8_29', 'class_10a8', 29, '100829', 'Huỳnh Trần Thục Nhi', 'Nữ', '', 'Kinh', 1, 0),
('10a8_30', 'class_10a8', 30, '100830', 'Trần Phạm Phương Nhi', 'Nữ', '', 'Kinh', 2, 0),
('10a8_31', 'class_10a8', 31, '100831', 'Khổng Hữu Phát', 'Nam', '', 'Kinh', 3, 0),
('10a8_32', 'class_10a8', 32, '100832', 'Lê Văn Gia Phúc', 'Nam', '', 'Kinh', 4, 0),
('10a8_33', 'class_10a8', 33, '100833', 'Voòng Thiên Phúc', 'Nam', '', 'Kinh', 1, 0),
('10a8_34', 'class_10a8', 34, '100834', 'Nguyễn Trung Quân', 'Nam', '', 'Kinh', 2, 0),
('10a8_35', 'class_10a8', 35, '100835', 'Nguyễn Minh Thái', 'Nam', '', 'Kinh', 3, 0),
('10a8_36', 'class_10a8', 36, '100836', 'Lý Ái Thiên', 'Nam', '', 'Kinh', 4, 0),
('10a8_37', 'class_10a8', 37, '100837', 'Nguyễn Giang Minh Trang', 'Nữ', '', 'Kinh', 1, 0),
('10a8_38', 'class_10a8', 38, '100838', 'Nguyễn Dương Minh Trí', 'Nam', '', 'Kinh', 2, 0),
('10a8_39', 'class_10a8', 39, '100839', 'Trương Thụy Phương Trúc', 'Nữ', '', 'Kinh', 3, 0),
('10a8_40', 'class_10a8', 40, '100840', 'Bành Gia Tuệ', 'Nữ', '', 'Kinh', 4, 0),
('10a8_41', 'class_10a8', 41, '100841', 'Lương Ái Vân', 'Nữ', '', 'Kinh', 1, 0),
('10a8_42', 'class_10a8', 42, '100842', 'Huỳnh Khánh Vy', 'Nữ', '', 'Kinh', 2, 0),
('10a8_43', 'class_10a8', 43, '100843', 'Võ Ngọc Tường Vy', 'Nữ', '', 'Kinh', 3, 0)
on conflict (id) do update set points = 0, name = excluded.name;


-- LỚP 10A1 (47 HỌC SINH)
insert into classes (id, academic_year, name, teacher_email, monitor_email)
values ('class_10a1', '2026-2027', 'Lớp 10A1', 'nguyensangnhc@gmail.com', null)
on conflict (id) do update set name = excluded.name;

insert into students (id, class_id, name, team, sbd, points, dob, gender, ethnic)
values
  ('10a1_1', 'class_10a1', 'Nguyễn Xuân Hoài An', 1, '10101', 0, '28/11/2011', 'Nam', 'Kinh'),
  ('10a1_2', 'class_10a1', 'Hoàng Lại Ân', 2, '10102', 0, '26/12/2011', 'Nam', 'Kinh'),
  ('10a1_3', 'class_10a1', 'Cao Nguyễn Tuấn Anh', 3, '10103', 0, '08/03/2011', 'Nam', 'Kinh'),
  ('10a1_4', 'class_10a1', 'Lê Mỹ Anh', 4, '10104', 0, '22/03/2011', 'Nữ', 'Kinh'),
  ('10a1_5', 'class_10a1', 'Nguyễn Ngọc Nguyệt Cát', 1, '10105', 0, '18/09/2011', 'Nữ', 'Kinh'),
  ('10a1_6', 'class_10a1', 'Lương Bằng Bảo Châu', 2, '10106', 0, '29/10/2011', 'Nữ', 'Kinh'),
  ('10a1_7', 'class_10a1', 'Châu Vũ Đạt', 3, '10107', 0, '28/01/2011', 'Nam', 'Kinh'),
  ('10a1_8', 'class_10a1', 'Dương Bá Đạt', 4, '10108', 0, '28/10/2011', 'Nam', 'Kinh'),
  ('10a1_9', 'class_10a1', 'Trương Nguyễn Hoàng Đạt', 1, '10109', 0, '27/06/2011', 'Nam', 'Kinh'),
  ('10a1_10', 'class_10a1', 'Nguyễn Thị Trà Giang', 2, '10110', 0, '29/11/2011', 'Nữ', 'Kinh'),
  ('10a1_11', 'class_10a1', 'Nguyễn Phương Nhật Hạ', 3, '10111', 0, '06/05/2011', 'Nữ', 'Kinh'),
  ('10a1_12', 'class_10a1', 'Lê Nguyễn Bảo Hân', 4, '10112', 0, '31/05/2011', 'Nữ', 'Kinh'),
  ('10a1_13', 'class_10a1', 'Bùi Nguyễn Huy Hoàng', 1, '10113', 0, '18/09/2011', 'Nam', 'Kinh'),
  ('10a1_14', 'class_10a1', 'Đàm Vĩnh Hùng', 2, '10114', 0, '15/01/2011', 'Nam', 'Kinh'),
  ('10a1_15', 'class_10a1', 'Nguyễn Minh Hương', 3, '10115', 0, '29/03/2011', 'Nữ', 'Kinh'),
  ('10a1_16', 'class_10a1', 'Đặng Hoàng Huy', 4, '10116', 0, '12/08/2011', 'Nam', 'Kinh'),
  ('10a1_17', 'class_10a1', 'Trịnh Quốc Huy', 1, '10117', 0, '11/04/2011', 'Nam', 'Kinh'),
  ('10a1_18', 'class_10a1', 'Đinh Hữu Tuấn Khang', 2, '10118', 0, '01/07/2011', 'Nam', 'Kinh'),
  ('10a1_19', 'class_10a1', 'Trần Đăng Khoa', 3, '10119', 0, '12/05/2011', 'Nam', 'Kinh'),
  ('10a1_20', 'class_10a1', 'Đào Mai Khôi', 4, '10120', 0, '15/07/2011', 'Nữ', 'Kinh'),
  ('10a1_21', 'class_10a1', 'Từ Khải Kiệt', 1, '10121', 0, '06/10/2011', 'Nam', 'Kinh'),
  ('10a1_22', 'class_10a1', 'Trần Quốc Kỳ', 2, '10122', 0, '21/11/2011', 'Nam', 'Kinh'),
  ('10a1_23', 'class_10a1', 'Trần Đình Long', 3, '10123', 0, '28/11/2011', 'Nam', 'Kinh'),
  ('10a1_24', 'class_10a1', 'Huỳnh Nhật Minh', 4, '10124', 0, '01/09/2011', 'Nam', 'Kinh'),
  ('10a1_25', 'class_10a1', 'Nguyễn Trà My', 1, '10125', 0, '24/09/2011', 'Nữ', 'Kinh'),
  ('10a1_26', 'class_10a1', 'Võ Nhật Nam', 2, '10126', 0, '25/11/2011', 'Nam', 'Kinh'),
  ('10a1_27', 'class_10a1', 'Lê Bảo Ngân', 3, '10127', 0, '12/08/2011', 'Nữ', 'Kinh'),
  ('10a1_28', 'class_10a1', 'Mai Nguyễn Khánh Ngọc', 4, '10128', 0, '17/07/2011', 'Nữ', 'Kinh'),
  ('10a1_29', 'class_10a1', 'Ngô Thanh Ngọc', 1, '10129', 0, '03/04/2011', 'Nữ', 'Kinh'),
  ('10a1_30', 'class_10a1', 'Nguyễn Công Phúc Nguyên', 2, '10130', 0, '03/01/2011', 'Nam', 'Kinh'),
  ('10a1_31', 'class_10a1', 'Lư Hoàng An Nhiên', 3, '10131', 0, '10/06/2011', 'Nữ', 'Kinh'),
  ('10a1_32', 'class_10a1', 'Nguyễn Thành Phong', 4, '10132', 0, '01/01/2011', 'Nam', 'Kinh'),
  ('10a1_33', 'class_10a1', 'Nguyễn Đình Phú', 1, '10133', 0, '15/06/2011', 'Nam', 'Kinh'),
  ('10a1_34', 'class_10a1', 'Nguyễn Xuân Phúc', 2, '10134', 0, '13/01/2011', 'Nam', 'Kinh'),
  ('10a1_35', 'class_10a1', 'Đào Thị Phương', 3, '10135', 0, '03/11/2011', 'Nữ', 'Kinh'),
  ('10a1_36', 'class_10a1', 'Huỳnh Ngọc Quyên', 4, '10136', 0, '28/03/2011', 'Nữ', 'Kinh'),
  ('10a1_37', 'class_10a1', 'Lại Đình Thịnh', 1, '10137', 0, '18/08/2011', 'Nam', 'Kinh'),
  ('10a1_38', 'class_10a1', 'Trần Khang Thịnh', 2, '10138', 0, '22/08/2011', 'Nam', 'Kinh'),
  ('10a1_39', 'class_10a1', 'Trần Thị Anh Thơ', 3, '10139', 0, '15/09/2011', 'Nữ', 'Kinh'),
  ('10a1_40', 'class_10a1', 'Nguyễn Đặng Minh Thư', 4, '10140', 0, '06/04/2011', 'Nữ', 'Kinh'),
  ('10a1_41', 'class_10a1', 'Phạm Ngọc Thanh Thùy', 1, '10141', 0, '04/09/2011', 'Nữ', 'Kinh'),
  ('10a1_42', 'class_10a1', 'Nguyễn Thanh Tịnh', 2, '10142', 0, '11/06/2011', 'Nam', 'Kinh'),
  ('10a1_43', 'class_10a1', 'Đồng Thị Thu Trâm', 3, '10143', 0, '21/05/2011', 'Nữ', 'Kinh'),
  ('10a1_44', 'class_10a1', 'Huỳnh Quang Vinh', 4, '10144', 0, '10/10/2010', 'Nam', 'Kinh'),
  ('10a1_45', 'class_10a1', 'Tô Trương Quốc Vinh', 1, '10145', 0, '02/11/2011', 'Nam', 'Kinh'),
  ('10a1_46', 'class_10a1', 'Phạm Đào Anh Vũ', 2, '10146', 0, '11/01/2011', 'Nam', 'Kinh'),
  ('10a1_47', 'class_10a1', 'Trần Nguyễn Tường Vy', 3, '10147', 0, '28/05/2011', 'Nữ', 'Kinh')
on conflict (id) do update set name = excluded.name, team = excluded.team, dob = excluded.dob, gender = excluded.gender;
