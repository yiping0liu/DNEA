function PlotDec(dec,Global,FrontNo,x0)

[N,D] = size(dec);
oMax=Global.upper;
oMin=Global.lower;

if Global.M>2
    psize = .1.*ones(1,4);
    center = [-.50,-.50;.50,-.50;.50,.50;-.50,.50];
    Points = NaN(Global.M,2,4);
    pgon = nsidedpoly(Global.M);
    for i=1:4
        Points(:,:,i) = pgon.Vertices.*psize(i)+center(i,:);
    end
else
    psize = 5.*ones(1,4);
    center = [-60,-20,20,60];
    Points = [center - psize; center + psize];
end

if D==3    
for i=1:4
    w = zeros(Global.M+1,3);
    w(:,3) = -1+.40*i; 
    w(:,1:2) = [Points(:,:,i);Points(1,:,i)];
    switch i
        case 1
            plot3(w(:,1),w(:,2),w(:,3),'r');
        case 2
            plot3(w(:,1),w(:,2),w(:,3),'b');
        case 3
            plot3(w(:,1),w(:,2),w(:,3),'g');
        case 4
            plot3(w(:,1),w(:,2),w(:,3),'k');
    end
    hold on;
end
end



% if D==2
% for i=1:N
%     switch FrontNo(i)
%         case 1
%             plot(dec(i,1),dec(i,2),'ok','MarkerSize',3,'Marker','o','Markeredgecolor',[1 0 0]);
%         case 2
%             plot(dec(i,1),dec(i,2),'ok','MarkerSize',3,'Marker','d','Markeredgecolor',[0 0 1]);
%         case 3
%             plot(dec(i,1),dec(i,2),'ok','MarkerSize',3,'Marker','v','Markeredgecolor',[0 .4 0]);
%         case 4
%             plot(dec(i,1),dec(i,2),'ok','MarkerSize',3,'Marker','s','Markeredgecolor',[.8 0 .8]);            
%         case 5
%             plot(dec(i,1),dec(i,2),'ok','MarkerSize',3,'Marker','x','Markeredgecolor',[.8 .8 0]);
%         case 6
%             plot(dec(i,1),dec(i,2),'ok','MarkerSize',3,'Marker','*','Markeredgecolor',[0 .8 .8]);
%         otherwise
%             plot(dec(i,1),dec(i,2),'ok','MarkerSize',8,'Marker','.','Markeredgecolor',[0.5 0.5 0.5]);
%     end
%     
% hold on;   
% end
% end
% 
% if D==3
% for i=1:N
%     switch FrontNo(i)
%         case 1
%             plot3(dec(i,1),dec(i,2),dec(i,3),'ok','MarkerSize',3,'Marker','o','Markeredgecolor',[1 0 0]);
%         case 2
%             plot3(dec(i,1),dec(i,2),dec(i,3),'ok','MarkerSize',3,'Marker','d','Markeredgecolor',[0 0 1]);
%         case 3
%             plot3(dec(i,1),dec(i,2),dec(i,3),'ok','MarkerSize',3,'Marker','v','Markeredgecolor',[0 .4 0]);
%         case 4
%             plot3(dec(i,1),dec(i,2),dec(i,3),'ok','MarkerSize',3,'Marker','s','Markeredgecolor',[.8 0 .8]);            
%         case 5
%             plot3(dec(i,1),dec(i,2),dec(i,3),'ok','MarkerSize',3,'Marker','x','Markeredgecolor',[.8 .8 0]);
%         case 6
%             plot3(dec(i,1),dec(i,2),dec(i,3),'ok','MarkerSize',3,'Marker','*','Markeredgecolor',[0 .8 .8]);
%         otherwise
%             plot3(dec(i,1),dec(i,2),dec(i,3),'ok','MarkerSize',8,'Marker','.','Markeredgecolor',[0.5 0.5 0.5]);
%     end
%     
% hold on;   
% end
% end

if D==2
    plot(dec(:,1),dec(:,2),'ok','MarkerSize',3,'Marker','o','Markeredgecolor',[0 0 1]);
elseif D==3
    plot3(dec(:,1),dec(:,2),dec(:,3),'ok','MarkerSize',3,'Marker','o','Markeredgecolor',[0 0 1]);     
end
hold on;


% x1 = [-0.6,-0.4]; % first PS
% x2 = [-0.5,-0.5]; % first PS
% plot(x1,x2,'k','LineWidth',1.5);
% 
% x1 = [0.4,0.6]; % second PS
% x2 = [0.5,0.5]; % second PS
% plot(x1,x2,'k','LineWidth',1.5);

if D==2
  xlabel('\itx\rm_1'); ylabel('\itx\rm_2');
  set(gca,'XTickMode','auto','YTickMode','auto','View',[0 90]);
  temp = zeros(1,size(oMax,2)+size(oMin,2));
    temp(1:2:end) = oMin;
    temp(2:2:end) = oMax;
    axis(temp(1:4));
elseif D==3
   xlabel('\itx\rm_1'); ylabel('\itx\rm_2'); zlabel('\itx\rm_3');
   set(gca,'XTickMode','auto','YTickMode','auto','ZTickMode','auto','View',[0 90]);
    temp = zeros(1,size(oMax,2)+size(oMin,2));
    temp(1:2:end) = oMin;
    temp(2:2:end) = oMax;
    axis(temp(1:6));  
end
        
x0=1800;
y0=0;
width=400;
height=400;
set(gca,'xtick',[-1 -0.5 0 0.5 1]);
set(gca,'ytick',[-1 -0.5 0 0.5 1]);
set(gcf,'units','points','position',[x0,y0,width,height]);
set(gca, 'Fontname', 'Times New Roman','FontSize',24);
%axis equal
grid on;
box on;
hold off;

end