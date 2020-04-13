clear;clc
%% ��������  ע��ע��ע�⣡����ʼ���д���ǰ��������涯������������ϵ��������ÿ�ְ�װ��ʽ�µ���ʾ��������

Lx1=1385;%2888.9388;%2624.2800;%3157;%�궨�ܵ���x��+����ʵ���ߵĳ���
Lx2=1345;%2887.5160;%2624.2800;%3157;%�궨�ܵ���x��-����ʵ���ߵĳ���
Ly1=1215;%2887.3198;%2622.2100;%3157;%�궨�ܵ���y��+����ʵ���ߵĳ���
Ly2=1247;%2887.6054;%2622.2100;%3157;%�궨�ܵ���y��-����ʵ���ߵĳ���

Q=91.23;%-90;%-90.036;%��������ת�Ƕȣ�������Ӧ�����ǶȽ�������
%ע��ע��ע�⣡���������¼������˳ʱ����תԼ90��Ϊ���ݣ�������˳/��ʱ��Կɣ���δ��֤��

coderA1 =-10895;%-4664.3032;  %-4189.929;%(-13963-13951-13955)/3;%y+��������
coderA2 = 11180;%4663.934;   %4206.7275;%(14026+14020+14021)/3;%y-��������
coderA3 =-12443;%-4745.9031;  %-4210.5853;%(-13997-14010-14009)/3;%x+��������
coderA4 = 12288;%4744.0638;%4156.7145;%(13982+13980+13971)/3;%x-��������

coderB1= 11264;% 4661.7981;%4200.3444;%(14035+14037+14037)/3;%y+��������
coderB2=-11531;%-4666.3794;%-4227.2943;%(-14005-14011-14009)/3;%y-��������
coderB3=-12235;%-4585.6036;%-4197.8226;%(-14010-14003-14008)/3;%x+��������
coderB4= 11986;%4580.2316;%4202.6313;%(14016+14018+14009)/3;%x-��������

%%  ��������
syms theta_A_plus theta_A_minus theta_B_plus theta_B_minus kA_plus kA_minus kB_plus kB_minus;

%%  ��һ�ְ�װ��ʽ��                                           ������        
%y+����:��A<0����B>0     ���A��B�����߷�ʽ������ y+����:��A>0����B<0  �� \          /
%y-����:��A>0����B<0�����߻������е�ʽ������ȷ���� y-����:��A<0����B>0  ��  \        /
%x+����:��A<0����B<0       ��ע��ע��ע�⣡��     x+����:��A<0����B<0       \    ��/
%x-����:��A>0����B>0                             x-����:��A>0����B>0        \  ��/
%                                                                            ������
%A������ϵ��theta_A_plus kA_plus
    r1=solve('-Ly2*cos(theta_A_plus)=kA_plus*coderA2','-Lx2*cos(Q*pi/180+theta_A_plus)=kA_plus*coderA4',theta_A_plus,kA_plus); 
    theta_A_plus=r1.theta_A_plus;
    kA_plus=r1.kA_plus; 

%A�ַ���ϵ��theta_A_minus kA_minus
    r2=solve('Ly1*cos(theta_A_minus)=kA_minus*coderA1','Lx1*cos(Q*pi/180+theta_A_minus)=kA_minus*coderA3',theta_A_minus,kA_minus);
    theta_A_minus=r2.theta_A_minus;
    kA_minus=r2.kA_minus;
   
%B������ϵ��theta_B_plus,k2_plus
    r3=solve('Ly1*cos(theta_B_plus)=kB_plus*coderB1','-Lx2*cos(Q*pi/180+theta_B_plus)=kB_plus*coderB4',theta_B_plus,kB_plus);
    theta_B_plus=r3.theta_B_plus;
    kB_plus=r3.kB_plus;    
      
%B�ַ���ϵ��theta_B_minus kB_minus
    r4=solve('-Ly2*cos(theta_B_minus)=kB_minus*coderB2','Lx1*cos(Q*pi/180+theta_B_minus)=kB_minus*coderB3',theta_B_minus,kB_minus);
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


