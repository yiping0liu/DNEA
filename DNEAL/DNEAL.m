function DNEAL(Global)
% <algorithm> <EMMO>
% Searching for Local Pareto Optimal Solutions: A Case Study on 
% Polygon-Based Problems
% mod --- 0 --- 0 both, 1 obj, 2 dec
% nb --- 3 --- Neighbor size 
% K --- 4 --- the number of non-dominated fronts to store
% Nns --- 50 --- the number of nearest solutions to be considered

%--------------------------------------------------------------------------
% Copyright 2018-2019 Yiping Liu
% This is the code of DNEAL proposed in "Yiping Liu, Hisao Ishibuchi, 
% Yusuke Nojima, Naoki Masuyama and Yuyan Han. Searching for Local Pareto 
% Optimal Solutions: A Case Study on Polygon-Based Problems. Proceedings of 
% IEEE Congress on Evolutionary Computation (CEC 2019), in press."
% Please contact {yiping0liu@gmail.com} if you have any problem.
%--------------------------------------------------------------------------
% This code uses PlatEMO published in "Ye Tian, Ran Cheng, Xingyi Zhang, 
% and Yaochu Jin, PlatEMO: A MATLAB Platform for Evolutionary 
% Multi-Objective Optimization [Educational Forum], IEEE Computational 
% Intelligence Magazine, 2017, 12(4): 73-87".
%--------------------------------------------------------------------------

    %% Parameter setting
    [mod,nb,K,Nns] = Global.ParameterSet(0,3,3,50);    
          
    %% Generate random population
    Population = Global.Initialization();
    [~,FrontNo,fDS] = MultiFront(Population,Global.N,nb,mod,K,Nns);

    %% Optimization
    while Global.NotTermination(Population)
        numPop = length(Population);
        FrontNo(FrontNo<=K)=1;
        MatingPool = TournamentSelection(2,numPop,FrontNo,fDS);
        Offspring  = Global.Variation(Population(MatingPool(1:Global.N)));                
        [Population,FrontNo,fDS] = MultiFront([Population,Offspring],Global.N,nb,mod,K,Nns);               
    end
end