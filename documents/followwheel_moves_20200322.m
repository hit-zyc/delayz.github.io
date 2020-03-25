clear;clc
%% ��������  ע��ע��ע�⣡����ʼ���д���ǰ��������涯������������ϵ��������ÿ�ְ�װ��ʽ�µ���ʾ��������

Lx=2624.2800;%3157;%�궨�ܵ���x��+-����ʵ���ߵĳ���
Ly=2622.2100;%3157;%�궨�ܵ���y��+-����ʵ���ߵĳ���

Q=-90;%-90.036;%��������ת�Ƕȣ�������Ӧ�����ǶȽ�������
%ע��ע��ע�⣡���������¼������˳ʱ����תԼ90��Ϊ���ݣ�������˳/��ʱ��Կɣ���δ��֤��

coderA1=-4189.929;%(-13963-13951-13955)/3;%y+��������
coderA2=4206.7275;%(14026+14020+14021)/3;%y-��������
coderA3=-4210.5853;%(-13997-14010-14009)/3;%x+��������
coderA4=4156.7145;%(13982+13980+13971)/3;%x-��������

coderB1=4200.3444;%(14035+14037+14037)/3;%y+��������
coderB2=-4227.2943;%(-14005-14011-14009)/3;%y-��������
coderB3=-4197.8226;%(-14010-14003-14008)/3;%x+��������
coderB4=4202.6313;%(14016+14018+14009)/3;%x-��������

%%  ��������
syms theta_A_plus theta_A_minus theta_B_plus theta_B_minus kA_plus kA_minus kB_plus kB_minus;

%%  ��һ�ְ�װ��ʽ��                                           ������        
%y+����:��A<0����B>0     ���A��B�����߷�ʽ������ y+����:��A>0����B<0  �� \          /
%y-����:��A>0����B<0�����߻������е�ʽ������ȷ���� y-����:��A<0����B>0  ��  \        /
%x+����:��A<0����B<0       ��ע��ע��ע�⣡��     x+����:��A<0����B<0       \    ��/
%x-����:��A>0����B>0                             x-����:��A>0����B>0        \  ��/
%                                                                            ������
%A������ϵ��theta_A_plus kA_plus
    r1=solve('-Ly*cos(theta_A_plus)=kA_plus*coderA2','Lx*cos(Q*pi/180+theta_A_plus)=kA_plus*coderA4',theta_A_plus,kA_plus); 
    theta_A_plus=r1.theta_A_plus;
    kA_plus=r1.kA_plus; 

%A�ַ���ϵ��theta_A_minus kA_minus
    r2=solve('Ly*cos(theta_A_minus)=kA_minus*coderA1','-Lx*cos(Q*pi/180+theta_A_minus)=kA_minus*coderA3',theta_A_minus,kA_minus);
    theta_A_minus=r2.theta_A_minus;
    kA_minus=r2.kA_minus;
   
%B������ϵ��theta_B_plus,k2_plus
    r3=solve('Ly*cos(theta_B_plus)=kB_plus*coderB1','Lx*cos(Q*pi/180+theta_B_plus)=kB_plus*coderB4',theta_B_plus,kB_plus);
    theta_B_plus=r3.theta_B_plus;
    kB_plus=r3.kB_plus;    
      
%B�ַ���ϵ��theta_B_minus kB_minus
    r4=solve('-Ly*cos(theta_B_minus)=kB_minus*coderB2','-Lx*cos(Q*pi/180+theta_B_minus)=kB_minus*coderB3',theta_B_minus,kB_minus);% L*sin(Q*pi/180-theta_B_minus)=kB_minus*coderB3
    theta_B_minus=r4.theta_B_minus;
    kB_minus=r4.kB_minus;  

%%  �ڶ��ְ�װ��ʽ��                                            ������
%y+����:��A<0����B>0     ���A��B�����߷�ʽ������ y+����:��A>0����B<0     / ��  \
%y-����:��A>0����B<0                             y-����:��A<0����B>0    /  ��   \
%x+����:��A>0����B>0                             x+����:��A>0����B>0   /         \  ��
%x-����:��A<0����B<0                             x-����:��A<0����B<0  /           \ ��
%                                                                              ������
% %A������ϵ��theta_A_plus kA_plus
%     r1=solve('-Ly*cos(theta_A_plus)=kA_plus*coderA2','-Lx*cos(Q*pi/180+theta_A_plus)=kA_plus*coderA3',theta_A_plus,kA_plus); 
%     theta_A_plus=r1.theta_A_plus;
%     kA_plus=r1.kA_plus; 
% 
% %A�ַ���ϵ��theta_A_minus kA_minus
%     r2=solve('Ly*cos(theta_A_minus)=kA_minus*coderA1','Lx*cos(Q*pi/180+theta_A_minus)=kA_minus*coderA4',theta_A_minus,kA_minus);
%     theta_A_minus=r2.theta_A_minus;
%     kA_minus=r2.kA_minus;
%    
% %B������ϵ��theta_B_plus,k2_plus
%     r3=solve('Ly*cos(theta_B_plus)=kB_plus*coderB1','-Lx*cos(Q*pi/180+theta_B_plus)=kB_plus*coderB3',theta_B_plus,kB_plus);
%     theta_B_plus=r3.theta_B_plus;
%     kB_plus=r3.kB_plus;    
%       
% %B�ַ���ϵ��theta_B_minus kB_minus
%     r4=solve('-Ly*cos(theta_B_minus)=kB_minus*coderB2','Lx*cos(Q*pi/180+theta_B_minus)=kB_minus*coderB4',theta_B_minus,kB_minus);% L*sin(Q*pi/180-theta_B_minus)=kB_minus*coderB3
%     theta_B_minus=r4.theta_B_minus;
%     kB_minus=r4.kB_minus;  

%%  �����ְ�װ��ʽ��ʱ�����õ�,��ʽ֮����Ҫʱ�Ƶ�

%%  �����ְ�װ��ʽ��
%y+����:��A<0����B<0         ���A��B�����߷�ʽ������ y+����:��A<0����B<0
%y-����:��A>0����B>0                                 y-����:��A>0����B>0   
%x+����:��A>0����B<0                                 x+����:��A<0����B>0
%x-����:��A<0����B>0                                 x-����:��A>0����B<0

%%  �����ְ�װ��ʽ��
%y+����:��A>0����B>0         ���A��B�����߷�ʽ������ y+����:��A>0����B>0
%y-����:��A<0����B<0                                 y-����:��A<0����B<0   
%x+����:��A>0����B<0                                 x+����:��A<0����B>0
%x-����:��A<0����B>0                                 x-����:��A>0����B<0
    
    
%% �õ�С����ʽ�Ľ�

theta_A_plus=double(subs(theta_A_plus));
theta_A_minus=double(subs(theta_A_minus));

theta_B_plus=double(subs(theta_B_plus));
theta_B_minus=double(subs(theta_B_minus));

kA_minus=double(subs(kA_minus));
kA_plus=double(subs(kA_plus));

kB_minus=double(subs(kB_minus));
kB_plus=double(subs(kB_plus));


