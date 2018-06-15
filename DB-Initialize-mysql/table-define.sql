-- テーブル作成
drop table if exists [テーブル名] cascade;
create table [テーブル名] (
  [カラム名] character varying(64) not null
  , constraint [テーブル名]_PKC primary key ([主キー])
) ;
create index [テーブル名]_IX1
  on [テーブル名]([主キー]);
