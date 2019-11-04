clear all;
clc;
model = MissileAndTarget(5,6,9);
model = setRand(model);
% x = get(model, 'pTargets')
f1 = getOptmizeMatrixOfFighterAndTarget(model)
f2 =  getOptmizeMatrixOfMissileAndTarget(model)
plan = [];missilePlan = [];

for i=1:600
    f1 = getOptmizeMatrixOfFighterAndTarget(model);
    meanF1(i) = mean(mean(f1));
    if i==1    %rem(i,10)==0  % rem%10 == 0
        mat =  getOptmizeMatrixOfFighterAndTarget(model);
        plan = quantumMinAssign(max(max(mat))-mat);
        plan = decodePlanFightersToTargets(model, plan); % ����
        %         if plan ~= oldplan
        %             oldplan
        %             plan
        %         end
    end
    model = fighterMove(model, plan);
    model = targetMove(model);
    figure(1);
    plot(model.Fighters.p(:,1), model.Fighters.p(:,2), 'g.');
    hold on;
    plot(model.Targets.p(:, 1), model.Targets.p(:,2), 'b.');
end
for i=601:800
    f2 =  getOptmizeMatrixOfMissileAndTarget(model);
    meanF2(i) = mean(mean(f2));
    if i==601
        mat =  getOptmizeMatrixOfMissileAndTarget(model);
        missilePlan = quantumMinAssign(max(max(mat))-mat);
        missilePlan = decodePlanMissilesToTargets(model, missilePlan) % ����
    end
    model = missileMoveByPNG(model, missilePlan);
    model = targetMove(model);
    figure(1);
    plot(model.Missiles.p(:,1), model.Missiles.p(:,2), 'r.');
    hold on;
    plot(model.Targets.p(:,1), model.Targets.p(:,2), 'b.');
    hold on;
    %axis([0 10000 0 10000]);
end

figure(2);
plot(meanF1,'r');
hold on;
plot(meanF2,'b')