create table if not exists player
(
    id bigint primary key,
    nickname text not null,
    country varchar(20),
    createdAt date,
    changeCount INT DEFAULT 0
);

create table if not exists restricted_words
(
    id serial primary key,
    word varchar(255) not null,
    country varchar(20) not null
);

create or replace function nickname_check()
returns trigger
as
$$
declare
    restricted_word record;
    old_nickname text;
begin
    if length(NEW.id::text) != 8 or substring(NEW.id::text from 1 for 1) = '0' then
        RAISE NOTICE 'Invalid ID';
        return NULL;
    end if;

    if (substring(NEW.id::text from 1 for 1) = '1' and NEW.country != 'China') or 
       (substring(NEW.id::text from 1 for 1) = '2' and NEW.country != 'America') or 
       (substring(NEW.id::text from 1 for 1) = '3' and NEW.country != 'Other') then
        RAISE NOTICE 'ID and country do not match';
        return NULL;
    end if;

    if length(NEW.nickname) < 4 or length(NEW.nickname) > 20 then
        RAISE NOTICE 'Invalid nickname length';
        return NULL;
    end if;

    if NEW.nickname !~ '^[a-zA-Z0-9_*#]+$' then
        RAISE NOTICE 'Invalid characters in nickname';
        return NULL;
    end if;

    if NEW.nickname !~ '[A-Z]' or NEW.nickname !~ '[a-z]' or NEW.nickname !~ '[0-9]' then
        RAISE NOTICE 'Nickname must contain at least one uppercase letter, one lowercase letter, and one number';
        return NULL;
    end if;

    if NEW.nickname in (select nickname from player) then
        RAISE NOTICE 'Nickname already exists';
        return NULL;
    end if;

    for restricted_word in (select word from restricted_words where country = NEW.country) loop
        if position(restricted_word.word in NEW.nickname) != 0 then
            RAISE NOTICE 'Nickname contains a restricted word';
            return NULL;
        end if;
    end loop;

    if position(NEW.id::text in NEW.nickname) != 0 then
        RAISE NOTICE 'Nickname cannot contain ID';
        return NULL;
    end if;

    if TG_OP = 'UPDATE' and NEW.nickname is not distinct from OLD.nickname then
        return NEW;
    end if;

    if TG_OP = 'UPDATE' then
        select into old_nickname nickname from player where id = NEW.id;
        if NEW.nickname = old_nickname then
            RAISE NOTICE 'New nickname cannot be the same as the old nickname';
            return NULL;
        end if;

        if NEW.changeCount >= 3 then
            RAISE NOTICE 'Nickname can only be changed 3 times';
            return NULL;
        end if;
        NEW.changeCount := NEW.changeCount + 1;
    end if;

    return NEW;
end
$$ language plpgsql;

create trigger nickname_trigger
before insert or update
on player
for each row
execute procedure nickname_check();

insert into player(id, nickname,country) values (11234567,'ZhangSan123','China'); --成功
insert into player(id, nickname,country) values (1111223,'ZhangSang123','China'); --id不合法
insert into player(id, nickname,country) values (11133223,'ZhangSang123aaaaaaaaaaa','USA'); -- 过长
insert into player(id, nickname,country) values (31112333,'ZhangSan123!','Other'); --含有非法字符
insert into player(id, nickname,country) values (21113333,'ZhangSan','America'); -- 无数字
insert into player(id, nickname,country) values (11123333,'zhangsan123','China'); --无大写
insert into player(id, nickname,country) values (11123344,'ABC1234567','China'); -- 无小写
insert into player(id, nickname,country) values (10131415,'WangfuckZi1999','China'); -- 成功
insert into player(id, nickname,country) values (12323435,'WWW2cnmd11111','China'); -- 包含敏感词汇
insert into player(id, nickname,country) values (22223145,'fuck2Shit','America'); --包含敏感词汇
insert into player(id, nickname,country) values (11234567,'LiSi0fuck11234567','China'); -- 包含id
insert into player(id, nickname,country) values (27184222,'Bright*Night0','America'); -- 成功
update player set nickname = 'Bright*Night0' where id = 27184222; -- 与旧昵称一致
update player set nickname = 'WangfuckZi1999' where id = 27184222; -- 重名
update player set nickname = 'BrightNight0' where id = 27184222; -- 成功
update player set nickname = 'BrightNight0123' where id = 27184222; -- 成功
update player set nickname = 'Bright0Night*' where id = 27184222; -- 成功
update player set nickname = 'Brigt0Night*' where id = 27184222; -- 更改名字超过三次
