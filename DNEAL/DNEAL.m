classdef DNEAL < ALGORITHM
% <multi> <real> <multimodal>
% Searching for Local Pareto Optimal Solutions: A Case Study on 
% Polygon-Based Problems
% mod --- 0 --- 0 both, 1 obj, 2 dec
% nb --- 3 --- Neighbor size 
% K --- 4 --- the number of non-dominated fronts to store
% Nns --- 50 --- the number of nearest solutions to be considered

%------------------------------- Reference --------------------------------
% Liu, Y., Ishibuchi, H., Nojima, Y., Masuyama, N. and Han, Y., 2019, June.
% Searching for local pareto optimal solutions: A case study on 
% polygon-based problems. In 2019 IEEE Congress on Evolutionary Computation
% (CEC) (pp. 896-903). IEEE.
%--------------------------------------------------------------------------
% Copyright Yiping Liu
% Please contact {yiping0liu@gmail.com} if you have any problem.
%--------------------------------------------------------------------------
    methods
        function main(Algorithm,Problem)
            %% Parameter setting
            [mod,nb,K,Nns] =  Algorithm.ParameterSet(0,3,3,50);    

            %% Generate random population
            Population = Problem.Initialization();
            [~,FrontNo,fDS] = MultiFront(Population,Problem.N,nb,mod,K,Nns);

            %% Optimization
            while Algorithm.NotTerminated(Population) 
                numPop = length(Population);
                FrontNo(FrontNo<=K)=1;
                MatingPool = TournamentSelection(2,numPop,FrontNo,fDS);
                Offspring  = OperatorGA(Population(MatingPool(1:Problem.N)));                
                [Population,FrontNo,fDS] = MultiFront([Population,Offspring],Problem.N,nb,mod,K,Nns);               
            end
        end
    end
end