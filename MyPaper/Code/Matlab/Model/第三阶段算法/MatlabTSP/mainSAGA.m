
% 数据部分
%%
city30=[41 94;37 84;54 67;25 62;7 64;2 99;68 58;71 44;54 62;83 69;64 60;18 54;22 60;
    83 46;91 38;25 38;24 42;58 69;71 71;74 78;87 76;18 40;13 40;82 7;62 32;58 35;45 21;41 26;44 35;4 50];%30 cities d'=423.741 by D B Fogel
%%
city50=[31 32;32 39;40 30;37 69;27 68;37 52;38 46;31 62;30 48;21 47;25 55;16 57;
    17 63;42 41;17 33;25 32;5 64;8 52;12 42;7 38;5 25; 10 77;45 35;42 57;32 22;
    27 23;56 37;52 41;49 49;58 48;57 58;39 10;46 10;59 15;51 21;48 28;52 33;
    58 27;61 33;62 63;20 26;5 6;13 13;21 10;30 15;36 16;62 42;63 69;52 64;43 67];%50 cities d'=427.855 by D B Fogel
%%
city75=[48 21;52 26;55 50;50 50;41 46;51 42;55 45;38 33;33 34;45 35;40 37;50 30;
    55 34;54 38;26 13;15 5;21 48;29 39;33 44;15 19;16 19;12 17;50 40;22 53;21 36;
    20 30;26 29;40 20;36 26;62 48;67 41;62 35;65 27;62 24;55 20;35 51;30 50;
    45 42;21 45;36 6;6 25;11 28;26 59;30 60;22 22;27 24;30 20;35 16;54 10;50 15;
    44 13;35 60;40 60;40 66;31 76;47 66;50 70;57 72;55 65;2 38;7 43;9 56;15 56;
    10 70;17 64;55 57;62 57;70 64;64 4;59 5;50 4;60 15;66 14;66 8;43 26];%75 cities d'=549.18 by D B Fogel
%%
city144=[3639	1315;
    4177	2244;
    3569	1438;
    3757	1187;
    3904	1289;
    3488	1535;
    3506	1221;
    3374	1750;
    3237	1764;
    3326	1556;
    3089	1251;
    3258	911;
    3238	1229;
    3646	234;
    4172	1125;
    4089	1387;
    4020	1142;
    4196	1044;
    4095	626;
    4312	790;
    4403	1022;
    4685	830;
    4361	73;
    4720	557;
    4634	654;
    4153	426;
    2846	1951;
    2831	2099;
    3054	1710;
    3086	1516;
    2562	1756;
    2716	1924;
    2291	1403;
    2751	1559;
    2012	1552;
    1779	1626;
    682	825;
    1478	267;
    518	1251;
    278	890;
    1332	695;
    3715	1678;
    4016	1715;
    4181	1574;
    4087	1546;
    3929	1892;
    4062	2220;
    3751	1945;
    4061	2370;
    4207	2533;
    4201	2397;
    4139	2615;
    3777	2095;
    3780	2212;
    3888	2261;
    3594	2900;
    3678	2463;
    3676	2578;
    3789	2620;
    4029	2838;
    3862	2839;
    3928	3029;
    4263	2931;
    4186	3037;
    3492	1901;
    3322	1916;
    3479	2198;
    3429	1908;
    3318	2408;
    3176	2150;
    3296	2217;
    3229	2367;
    3394	2643;
    3402	2912;
    3101	2721;
    3402	2510;
    3792	3156;
    3468	3018;
    3142	3421;
    3356	3212;
    3130	2973;
    3044	3081;
    2765	3321;
    3140	3557;
    2545	2357;
    2769	2492;
    2611	2275;
    2348	2652;
    3712	1399;
    3493	1696;
    3791	1339;
    3376	1306;
    3188	1881;
    3814	261;
    3583	864;
    4297	1218;
    4116	1187;
    4252	882;
    4386	570;
    4643	404;
    4784	279;
    3077	1970;
    1828	1210;
    2061	1277;
    2788	1491;
    2381	1676;
    1777	892;
    1064	284;
    3688	1818;
    3896	1656;
    3918	2179;
    3972	2136;
    4029	2498;
    3766	2364;
    3896	2443;
    3796	2499;
    3478	2705;
    3810	2969;
    4167	3206;
    3486	1755;
    3334	2107;
    3587	2417;
    3507	2376;
    3264	2551;
    3360	2792;
    3439	3201;
    3526	3263;
    3012	3394;
    2935	3240;
    3053	3739;
    2284	2803;
    2577	2574;
    2860	2862;
    2801	2700;
    2370	2975;
    1084	2313;
    2778	2826;
    2126	2896;
    1890	3033;
    3538	3298;
    2592	2820;
    2401	3164;
    1304	2312;
    3470	3304;];%中国144城市相对坐标，最小距离为30056
city=city144;
numOfCity = size(city,1);
cityP = city;

% numOfCity = obj.numOfTargets+1;
% cityP = obj.Targets.p;
% cityP(numOfCity,:) = obj.Fighters.p(1,:);

TSPobj = TSPModel(numOfCity,cityP);

Top = 1000; Dop = 0.99;
popsize=100;steps=1000;Pcross=0.5;Pmutate=0.5;
[planSAGA, fBestSave,fMeanSave, time] = SAGA(TSPobj,popsize,steps,Pcross,Pmutate, "PMX", "SIM",Top,Dop);
planSAGA = TSPpath_decode( planSAGA);
fBestSave(length(fBestSave))

% plot
figure1 = figure('color',[1 1 1]);
plot(fBestSave);hold on;
plot(fMeanSave);hold on;

% plot
figure2 = figure('color',[1 1 1]);
P=city;N=numOfCity;minplan=planSAGA;
plot(P(:,1),P(:,2),'ro');
hold on
for i=1:N-1
    line([P(minplan(i),1),P(minplan(i+1),1)],[P(minplan(i),2),P(minplan(i+1),2)]);
end
 line([P(minplan(1),1),P(minplan(N),1)],[P(minplan(1),2),P(minplan(N),2)]);
 for i=1:N
    str=sprintf('%d',i);
   text(P(i,1)+0.3,P(i,2),str);
end


function [ path ] =TSPpath_decode( path0 )
%  路径从1开始算的路径表示
[~,num] = size(path0);
[~,p1]=find(path0==1);
path(1:num-p1+1)=path0(p1:num);
path(num-p1+2:num)=path0(1:p1-1);
if path(2)>path(num)
    temp1=path(2:num);
    temp1=fliplr(temp1);%倒序
    path(2:num)=temp1;
end
end
