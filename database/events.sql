CREATE TABLE [Events](
  [id] int IDENTITY(1,1) NOT NULL,
  [text] nvarchar(256) NULL,
  [start_date] datetime NOT NULL,
  [end_date] datetime NOT NULL,
  PRIMARY KEY (id)
)

select * from agendamentos

insert into events
(text,start_date,end_date)
values
('teste1','13/03/2016 09:00:00','13/03/2016 10:00:00')

insert into events
(text,start_date,end_date)
values
('teste2','13/03/2016 10:00:00','13/03/2016 11:00:00')