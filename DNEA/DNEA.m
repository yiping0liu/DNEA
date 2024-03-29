classdef DNEA < ALGORITHM
% <multi> <real> <multimodal>
% A Double-Niched Evolutionary Algorithm and its Behaviors on Polygon-Based
% Problems
% mod --- 0 --- 0 Double, 1 Obj, 2 Dec
% nb --- 3 --- Neighbor size 

%------------------------------- Reference --------------------------------
% Liu, Y., Ishibuchi, H., Nojima, Y., Masuyama, N. and Shang, K., 2018, 
% September. A double-niched evolutionary algorithm and its behavior on 
% polygon-based problems. In International Conference on Parallel Problem 
% Solving from Nature (pp. 262-273). Springer, Cham.
%--------------------------------------------------------------------------
% Copyright Yiping Liu
% Please contact {yiping0liu@gmail.com} if you have any problem.
%--------------------------------------------------------------------------

    methods
        function main(Algorithm,Problem)
            %% Parameter setting
            [mod,nb] = Algorithm.ParameterSet(0,3);     
    
            %% Generate random population
            Population = Problem.Initialization();
            [~,FrontNo,fDS] = EnvironmentalSelection(Population,Problem.N,nb,mod);       
    
            %% Optimization   
            while Algorithm.NotTerminated(Population)       
                MatingPool = TournamentSelection(2,Problem.N,FrontNo,fDS);
                Offspring  = OperatorGA(Population(MatingPool));                
                [Population,FrontNo,fDS] = EnvironmentalSelection([Population,Offspring],Problem.N,nb,mod);              
            end
        end
    end
end