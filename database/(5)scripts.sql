insert into configuracoes (nome_conf, caminho_images)
values ('medPortal','C:\\programas\T C C\med_admin\MedPortal\Images\');
go

alter table configuracoes add usuario_ftp varchar(100);
alter table configuracoes add senha_ftp varchar(100);

select * from configuracoes

