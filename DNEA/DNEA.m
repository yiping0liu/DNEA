function DNEA(Global)
% <algorithm> <EMMO>
% A Double-Niched Evolutionary Algorithm and its Behaviors on Polygon-Based
% Problems
% mod --- 0 --- 0 Double, 1 Obj, 2 Dec
% nb --- 3 --- Neighbor size 

%--------------------------------------------------------------------------
% Copyright 2018-2019 Yiping Liu
% This is the code of DNEA proposed in "Yiping Liu, Hisao Ishibuchi, Yusuke
% Nojima, Naoki Masuyama and Ke Shang. A Double-Niched Evolutionary 
% Algorithm and its Behaviors on Polygon-Based Problems. Proceedings of 
% Conference on Parallel Problem Solving from Nature (PPSN 2018), 263-273."
% Please contact {yiping0liu@gmail.com} if you have any problem.
%--------------------------------------------------------------------------
% This code uses PlatEMO published in "Ye Tian, Ran Cheng, Xingyi Zhang, 
% and Yaochu Jin, PlatEMO: A MATLAB Platform for Evolutionary 
% Multi-Objective Optimization [Educational Forum], IEEE Computational 
% Intelligence Magazine, 2017, 12(4): 73-87".
%--------------------------------------------------------------------------

    %% Parameter setting
    [mod,nb] = Global.ParameterSet(0,3);      
    
    %% Generate random population
    Population = Global.Initialization();       
    [~,FrontNo,fDS] = EnvironmentalSelection(Population,Global.N,nb,mod);       
    
    %% Optimization   
    while Global.NotTermination(Population)             
        MatingPool = TournamentSelection(2,Global.N,FrontNo,fDS);
        Offspring  = Global.Variation(Population(MatingPool));                
        [Population,FrontNo,fDS] = EnvironmentalSelection([Population,Offspring],Global.N,nb,mod);           
    end
end