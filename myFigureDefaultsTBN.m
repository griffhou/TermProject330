function [colvect]=myFigureDefaultsTBN(scale,pref)

if nargin == 0
    scale = 2;
end
if nargin < 2
    pref = 'lg';
end

set(0,'DefaultAxesFontName','Times New Roman');
set(0,'DefaultTextFontName','Times New Roman');
switch pref
    case 'lg'
        set(0,'DefaultAxesFontSize',10*scale);  % for a paper, this should be 18
        set(0,'DefaultTextFontSize',10*scale);
    case 'sm'
        set(0,'DefaultAxesFontSize',7*scale);  % for a paper, this should be 18
        set(0,'DefaultTextFontSize',7*scale);
    otherwise
        error('Pref: unknown value')
end
set(0,'DefaultAxesFontWeight','demi')
set(0,'DefaultTextFontWeight','demi')
set(0,'DefaultAxesLineWidth',1*scale); % for paper consider 2
set(0,'DefaultLineLineWidth',1*scale);
set(0,'DefaultLineMarkersize',4*scale); % for paper consider 8
% set(0,'DefaultAxesUnits','inches')
% set(0,'DefaultFigureUnits','inches')
% figuresize = [1 1 9 6];
% set(0,'DefaultFigurePosition',figuresize);
% set(0,'DefaultFigurePaperSize', figuresize(3:4));
% set(0,'DefaultFigurePosition',get(0,'ScreenSize')); % change to correct dim
% set(0,'DefaultFigurePosition',[100 100 800 600]); % conside [1 1 6.5 6] for a paper
 %set(0,'DefaultFigurePosition',[1 1 6 7.5]);
 %set(0,'DefaultFigurePosition', [46 1 500 500]); %TBN Sept 2016
set(0,'DefaultAxesColorOrder',[0,0,0;1 0 0])
set(0,'DefaultAxesLineStyleOrder',{'-','--',':','-.'})
% set(0,'DefaultAxesColorOrder',[0,0,0; 1,0,0; 0,0,1])
% set(0,'DefaultAxesColorOrder',distinguishable_colors(10),...
%     'DefaultAxesLineStyleOrder',{'-','--',':'})
% set(0,'DefaultAxesLineStyleOrder','-|--|:|-.')
% set(0,'DefaultAxesLineStyleOrder',{'-','--',':'})
% set(0,'DefaultAxesColorOrder',distinguishable_colors(3))%,...
%       'DefaultAxesLineStyleOrder','-|--|:|-.')

colvect=[...
    45,73,121;...       blue    
    204,34,6;...        red
    0,127.5,0;...       green
    117,51,183;...      purple 
    255 128 0;... %orange
112 128 144;,...%slategray 
30 144 255;...%dodgerblue 
 255	192	203;... %  pink 
 148 0 211;... %darkviolet 
 0 245 255;...turquoise 
0 100 0;...%darkgreen  
 102	205	0;%chartreuse3 
238 201 0;... %gold2  
139 69 19;...%chocolate
];

%colors = {'k', 'r', 'b', darkgreen, gold2, turquoise, orange, ...
%    darkviolet, dodgerblue, pink,...
%    chartreuse3, chocolate, slategray};

%colvect = [0,0,0; 1,0,0; 0,0,1; darkgreen;  gold2;   ...
%    turquoise; orange; darkviolet; ...
%    dodgerblue; pink; chartreuse3; chocolate; slategray];​
set(0, 'DefaultAxesColorOrder', colvect);

end