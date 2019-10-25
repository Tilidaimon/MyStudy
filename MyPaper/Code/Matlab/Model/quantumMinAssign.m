% �����Ż��㷨����С��ָ������
% ����m*n��һ���������plan 2*n , ��һ�ж�ӦĿ�����У��ڶ��ж�Ӧִ��������
function plan = quantumMinAssign(matrix)
[m,n] = size(matrix);
% ����С����������������������ֵΪԭ��������ֵ
inf = max(max(matrix));
N = max(m,n);
mat = inf*ones(N,N); % �¾���
if m < n
    mat(1:m,:) = matrix;
end
if m > n
    mat(:,1:n) = matrix;
end
plan = qMinAssign(mat);
if m < n   
    for i=1:n
        if plan(2,i) > m
            plan(2,i) = 0;
        end
    end
end
if m > n
    for i=1:m
        if plan(1,i) > n
            plan(1,i) = 0;
        end
    end
    plan = plan(:,1:n);
end

end



function plan = qMinAssign(C)

%inputs:CĿ��ϵ������ֻ���Ƿ��󡣷Ƿ�����Ҫת����
%���ӹ滮��plan���ӹ滮������ʵֵ���룬y���Թ滮��01���룬����ȡ����y�����
%�÷������ù̶�������ֻ�����һ�������
C=C';
f=C(:);
[~,n]=size(C);
Aeq=zeros(2*n,n*n);
for i=1:n
    Aeq(1:n,1+(i-1)*n:i*n)=eye(n);
end
for i=1:n
    Aeq(n+i,1+(i-1)*n:i*n)=ones(1,n);%һ��n��Ԫ��Ϊ1����
end

beq=ones(2*n,1);%��ʽԼ���Ҷ���
lb=zeros(n*n,1);%����ʽԼ�����
ub=ones(n*n,1);%����ʽԼ���Ҷ�

%�㷨ѡ��
%x0=rand(n,n);%�ڵ�
% options = optimoptions('linprog','Algorithm','interior-point','Display','final');%�ڵ㷨�����ģ
% options = optimoptions('linprog','Algorithm','active-set','Display','final');%���ι滮���еȹ�ģ
% options = optimoptions('linprog','Algorithm','simplex','Display','final');%�����η���С��ģ
% if n<=100
%     options = optimoptions('linprog','Algorithm','active-set','Display','final')
%     x=linprog(f,[],[],Aeq,beq,lb,ub,x0,options);
%
% else x=linprog(f,[],[],Aeq,beq,lb,ub);%Ĭ���ڵ㷨
% end
x=linprog(f,[],[],Aeq,beq,lb,ub);%Ĭ���ڵ㷨
y=reshape(x,n,n);
y=y';
plan= gradualMax( y,n);%�̶�̮������
end

function plan = gradualMax( a,N)
%  ���ȡ���
Msort = zeros(1,N);
Tsort = zeros(1,N);
for j=1:N
    [row ,clo]=find(a==max(max(a)),1);
    Msort(j)=row;    % ��һ����Ϊ�˷�ֹ�����������ֵ��ֻҪ��һ��
    Tsort(j)=clo;
    a(Msort(j),:)=0;
    a(:,Tsort(j))=0;
end
temp=sortrows([Msort',Tsort'],2);
plan(2,:) = temp(:,1)';
plan(1,:) = 1:N;
end
