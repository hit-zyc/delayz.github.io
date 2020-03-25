clear;clc
%% 输入数据  注意注意注意！：开始运行代码前，输入的随动轮数据正负关系必须满足每种安装方式下的提示！！！！

Lx=2624.2800;%3157;%标定架底盘x轴+-方向实际走的长度
Ly=2622.2100;%3157;%标定架底盘y轴+-方向实际走的长度

Q=-90;%-90.036;%陀螺仪旋转角度，该数据应经过角度矫正处理
%注意注意注意！！！：以下计算均以顺时针旋转约90°为依据（理论上顺/逆时针皆可，但未验证）

coderA1=-4189.929;%(-13963-13951-13955)/3;%y+方向数据
coderA2=4206.7275;%(14026+14020+14021)/3;%y-方向数据
coderA3=-4210.5853;%(-13997-14010-14009)/3;%x+方向数据
coderA4=4156.7145;%(13982+13980+13971)/3;%x-方向数据

coderB1=4200.3444;%(14035+14037+14037)/3;%y+方向数据
coderB2=-4227.2943;%(-14005-14011-14009)/3;%y-方向数据
coderB3=-4197.8226;%(-14010-14003-14008)/3;%x+方向数据
coderB4=4202.6313;%(14016+14018+14009)/3;%x-方向数据

%%  创建变量
syms theta_A_plus theta_A_minus theta_B_plus theta_B_minus kA_plus kA_minus kB_plus kB_minus;

%%  第一种安装方式：                                           ···        
%y+方向:ΔA<0、ΔB>0     如果A、B轮连线方式互换： y+方向:ΔA>0、ΔB<0  · \          /
%y-方向:ΔA>0、ΔB<0（连线互换下列等式将不正确！） y-方向:ΔA<0、ΔB>0  ·  \        /
%x+方向:ΔA<0、ΔB<0       （注意注意注意！）     x+方向:ΔA<0、ΔB<0       \    。/
%x-方向:ΔA>0、ΔB>0                             x-方向:ΔA>0、ΔB>0        \  。/
%                                                                            。。。
%A轮正向系数theta_A_plus kA_plus
    r1=solve('-Ly*cos(theta_A_plus)=kA_plus*coderA2','Lx*cos(Q*pi/180+theta_A_plus)=kA_plus*coderA4',theta_A_plus,kA_plus); 
    theta_A_plus=r1.theta_A_plus;
    kA_plus=r1.kA_plus; 

%A轮反向系数theta_A_minus kA_minus
    r2=solve('Ly*cos(theta_A_minus)=kA_minus*coderA1','-Lx*cos(Q*pi/180+theta_A_minus)=kA_minus*coderA3',theta_A_minus,kA_minus);
    theta_A_minus=r2.theta_A_minus;
    kA_minus=r2.kA_minus;
   
%B轮正向系数theta_B_plus,k2_plus
    r3=solve('Ly*cos(theta_B_plus)=kB_plus*coderB1','Lx*cos(Q*pi/180+theta_B_plus)=kB_plus*coderB4',theta_B_plus,kB_plus);
    theta_B_plus=r3.theta_B_plus;
    kB_plus=r3.kB_plus;    
      
%B轮反向系数theta_B_minus kB_minus
    r4=solve('-Ly*cos(theta_B_minus)=kB_minus*coderB2','-Lx*cos(Q*pi/180+theta_B_minus)=kB_minus*coderB3',theta_B_minus,kB_minus);% L*sin(Q*pi/180-theta_B_minus)=kB_minus*coderB3
    theta_B_minus=r4.theta_B_minus;
    kB_minus=r4.kB_minus;  

%%  第二种安装方式：                                            。。。
%y+方向:ΔA<0、ΔB>0     如果A、B轮连线方式互换： y+方向:ΔA>0、ΔB<0     / 。  \
%y-方向:ΔA>0、ΔB<0                             y-方向:ΔA<0、ΔB>0    /  。   \
%x+方向:ΔA>0、ΔB>0                             x+方向:ΔA>0、ΔB>0   /         \  。
%x-方向:ΔA<0、ΔB<0                             x-方向:ΔA<0、ΔB<0  /           \ 。
%                                                                              。。。
% %A轮正向系数theta_A_plus kA_plus
%     r1=solve('-Ly*cos(theta_A_plus)=kA_plus*coderA2','-Lx*cos(Q*pi/180+theta_A_plus)=kA_plus*coderA3',theta_A_plus,kA_plus); 
%     theta_A_plus=r1.theta_A_plus;
%     kA_plus=r1.kA_plus; 
% 
% %A轮反向系数theta_A_minus kA_minus
%     r2=solve('Ly*cos(theta_A_minus)=kA_minus*coderA1','Lx*cos(Q*pi/180+theta_A_minus)=kA_minus*coderA4',theta_A_minus,kA_minus);
%     theta_A_minus=r2.theta_A_minus;
%     kA_minus=r2.kA_minus;
%    
% %B轮正向系数theta_B_plus,k2_plus
%     r3=solve('Ly*cos(theta_B_plus)=kB_plus*coderB1','-Lx*cos(Q*pi/180+theta_B_plus)=kB_plus*coderB3',theta_B_plus,kB_plus);
%     theta_B_plus=r3.theta_B_plus;
%     kB_plus=r3.kB_plus;    
%       
% %B轮反向系数theta_B_minus kB_minus
%     r4=solve('-Ly*cos(theta_B_minus)=kB_minus*coderB2','Lx*cos(Q*pi/180+theta_B_minus)=kB_minus*coderB4',theta_B_minus,kB_minus);% L*sin(Q*pi/180-theta_B_minus)=kB_minus*coderB3
%     theta_B_minus=r4.theta_B_minus;
%     kB_minus=r4.kB_minus;  

%%  后两种安装方式暂时不会用到,公式之后需要时推导

%%  第三种安装方式：
%y+方向:ΔA<0、ΔB<0         如果A、B轮连线方式互换： y+方向:ΔA<0、ΔB<0
%y-方向:ΔA>0、ΔB>0                                 y-方向:ΔA>0、ΔB>0   
%x+方向:ΔA>0、ΔB<0                                 x+方向:ΔA<0、ΔB>0
%x-方向:ΔA<0、ΔB>0                                 x-方向:ΔA>0、ΔB<0

%%  第四种安装方式：
%y+方向:ΔA>0、ΔB>0         如果A、B轮连线方式互换： y+方向:ΔA>0、ΔB>0
%y-方向:ΔA<0、ΔB<0                                 y-方向:ΔA<0、ΔB<0   
%x+方向:ΔA>0、ΔB<0                                 x+方向:ΔA<0、ΔB>0
%x-方向:ΔA<0、ΔB>0                                 x-方向:ΔA>0、ΔB<0
    
    
%% 得到小数形式的解

theta_A_plus=double(subs(theta_A_plus));
theta_A_minus=double(subs(theta_A_minus));

theta_B_plus=double(subs(theta_B_plus));
theta_B_minus=double(subs(theta_B_minus));

kA_minus=double(subs(kA_minus));
kA_plus=double(subs(kA_plus));

kB_minus=double(subs(kB_minus));
kB_plus=double(subs(kB_plus));


