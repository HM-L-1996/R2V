-- user �׽�Ʈ ������
insert into user values (null,'admin','ad_nickname','1234','������','211218','admin@admin.com',1,default);
insert into user values (null,'test','tes_nickname','12345','�����1','211217','test@test.com',3,default);
insert into user values (null,'test1','hm_nickname','123','������','960101','test1@test1.com',1,default);
insert into user values (null,'test2','jy_nickname','124','���ؿ�','920304','test2@test2.com',1,default);
insert into user values (null,'test3','bs_nickname','125','�����','001205','test3@test3.com',1,default);
insert into user values (null,'test4','mk_nickname','126','�ڹα�','960503','test4@test4.com',1,default);
insert into user values (null,'test5','ms_nickname','127','�ڸ�','780402','test5@test5.com',1,default);
insert into user values (null,'test6','jw_nickname','128','������','970304','test6@test6.com',1,default);
insert into user values (null,'test7','fu_nickname','129','ȫ�浿','010507','test7@test7.com',1,default);
insert into user values (null,'test8','ck_nickname','120','�����','020607','test8@test8.com',0,default);

select * from user;

-- notice �׽�Ʈ ������

insert into notice values (null,"�������� �׽�Ʈ1","�������� �׽�Ʈ ��~",default,0);
insert into notice values (null,"�������� �׽�Ʈ2","���������Դϴ�.",default,0);
insert into notice values (null,"�������� �׽�Ʈ3","���������̿���.",default,0);
insert into notice values (null,"�������� �׽�Ʈ4","������ ���������ϴ�.",default,0);
insert into notice values (null,"�������� �׽�Ʈ5","������ ���� 5������Դϴ�.",default,0);
insert into notice values (null,"�������� �׽�Ʈ6","�μ�Ƽ�� ����Դϴ�.",default,0);
insert into notice values (null,"�������� �׽�Ʈ7","���޴��� ����Դϴ�.",default,0);
insert into notice values (null,"�������� �׽�Ʈ8","�������� ������",default,0);
insert into notice values (null,"�������� �׽�Ʈ9","�����ΰ�",default,0);
insert into notice values (null,"�������� �׽�Ʈ0","ȫ��Ȱ�� ���",default,0);
insert into notice values (null,"�������� �׽�Ʈ11","�ҹ��α���",default,0);

select * from notice;

-- free �׽�Ʈ ������

insert into free values (null,2,"�����Խ��� �׽�Ʈ1","�����Խ��� �׽�Ʈ��",default,0);
insert into free values (null,1,"�����Խ��� �׽�Ʈ2","�����Խ��� �׽�Ʈ��2",default,0);
insert into free values (null,3,"�����Խ��� �׽�Ʈ3","�����Խ��� �׽�Ʈ��3",default,0);
insert into free values (null,4,"�����Խ��� �׽�Ʈ4","�����Խ��� �׽�Ʈ��4",default,0);
insert into free values (null,5,"�����Խ��� �׽�Ʈ5","�����Խ��� �׽�Ʈ��5",default,0);
insert into free values (null,6,"�����Խ��� �׽�Ʈ6","�����Խ��� �׽�Ʈ��6",default,0);
insert into free values (null,7,"�����Խ��� �׽�Ʈ7","�����Խ��� �׽�Ʈ��7",default,0);
insert into free values (null,8,"�����Խ��� �׽�Ʈ8","�����Խ��� �׽�Ʈ��8",default,0);
insert into free values (null,9,"�����Խ��� �׽�Ʈ9","�����Խ��� �׽�Ʈ��9",default,0);
insert into free values (null,10,"�����Խ��� �׽�Ʈ0","�����Խ��� �׽�Ʈ��0",default,0);
insert into free values (null,10,"�����Խ��� �׽�Ʈ11","�����Խ��� �׽�Ʈ��11",default,0);
insert into free values (null,10,"�����Խ��� �׽�Ʈ12","�����Խ��� �׽�Ʈ��12",default,0);

select * from free;

-- review �׽�Ʈ ������
insert into review values (null,2,5,"���� �Խ��� �׽�Ʈ��",default,0);
insert into review values (null,1,4,"���� �Խ��� �׽�Ʈ��2",default,0);
insert into review values (null,3,3,"���� �Խ��� �׽�Ʈ��3",default,0);
insert into review values (null,4,2,"���� �Խ��� �׽�Ʈ��4",default,0);
insert into review values (null,5,1,"���� �Խ��� �׽�Ʈ��5",default,0);
insert into review values (null,6,6,"���� �Խ��� �׽�Ʈ��6",default,0);
insert into review values (null,7,7,"���� �Խ��� �׽�Ʈ��7",default,0);
insert into review values (null,8,8,"���� �Խ��� �׽�Ʈ��8",default,0);
insert into review values (null,9,9,"���� �Խ��� �׽�Ʈ��9",default,0);
insert into review values (null,10,10,"���� �Խ��� �׽�Ʈ��10",default,0);
insert into review values (null,2,11,"���� �Խ��� �׽�Ʈ��11",default,0);
insert into review values (null,1,12,"���� �Խ��� �׽�Ʈ��12",default,0);

select * from free;

select * from learn where learn_title like "%[%";



