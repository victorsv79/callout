/* a.    Написать запрос, который выдаст все заявки, которые были отработаны после «2020-12-02 12:00:00».
Формат вывода должен быть следующий: номер заявки, имя пользователя, время отработки, название статуса.
Данные должны быть отсортированы по возрастанию по дате отработки. */

select t.tt_number, u.name as user, t.work_time, s.name as status
from TroubleTickets t
    join Users u on u.id = t.user_id
    join TTStatus s on s.id = t.tt_status
where t.work_time > "2020-12-02 12:00:00"
order by t.work_time asc;

/* b.    Написать запрос, который выдаст все заявки, отработанные «Петровой Марией» со статусом «ожидание».
Формат вывода должен быть следующий: номер заявки, имя пользователя, время отработки, название статуса. */
select t.tt_number, u.name as user, t.work_time, s.name as status
from TroubleTickets t
    join Users u on u.id = t.user_id
    join TTStatus s on s.id = t.tt_status
where u.name = "Петрова Мария" and s.name = "ожидание"

/* c.    Написать запрос, который выдаст все заявки, отработанные сотрудниками с фамилией «Иванов» со статусом «ожидание».
Формат вывода должен быть следующий: номер заявки, имя пользователя, время отработки, название статуса.
Данные должны быть отсортированы по убыванию по дате отработки. */
select t.tt_number, u.name as user, t.work_time, s.name as status
from TroubleTickets t
    join Users u on u.id = t.user_id
    join TTStatus s on s.id = t.tt_status
where u.name like "Иванов %" and s.name = "ожидание"
order by t.work_time desc;


/* d.    Написать запрос, который выдаст количество отработанных заявок по дням,
со статусом «открыта» и «ожидание» за период «2020-12-02» по «2020-12-04».
Формат вывода должен быть следующий: дата в формате день-месяц-год, название статуса, количество заявок. */
select date(t.work_time) as work_date, s.name as status, count(*)
from TroubleTickets t
    join TTStatus s on s.id = t.tt_status
where s.name in ("открыта","ожидание") and DATE(t.work_time) BETWEEN '2020-12-02' and '2020-12-04'
group by date(t.work_time), s.name

-- Если статус заявки не важен, то получится чисто по дням так:
select date(t.work_time) as work_date, count(*)
from TroubleTickets t
    join TTStatus s on s.id = t.tt_status
where s.name in ("открыта","ожидание") and DATE(t.work_time) BETWEEN '2020-12-02' and '2020-12-04'
group by date(t.work_time)

/* e.    Написать запрос, который выведет всех пользователей и количество
их заявок со статусом «открыта» с сортировкой по имени пользователя.*/

select u.name, (select count(*)
                from TroubleTickets t
                         join TTStatus s on s.id = t.tt_status
                where t.user_id = u.id and s.name = "открыта"
    ) as count
from Users u
order by u.name

-- если под именем подразумевает имя без фамилии, то можно так:
select u.name, (select count(*)
                from TroubleTickets t
                         join TTStatus s on s.id = t.tt_status
                where t.user_id = u.id and s.name = "открыта"
    ) as count
from Users u
order by SUBSTRING_INDEX(u.name,' ',2)






