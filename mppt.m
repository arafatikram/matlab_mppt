function D = mppt(Vpv, Ipv)
%Previously defined
persistent Dprev Pprev Vprev
if isempty(Dprev)
    Dprev = 0.7; %duty cycle
    Pprev = 2000; %Power
    Vprev = 190; %voltage
end
DelD = 125e-6;
Pvp = Vpv*Ipv;

if (Pvp-Pprev) ~=0
    if(Pvp-Pprev)>0
        if(Vpv-Vprev)> 0
            D = Dprev - DelD;
        else
            D = Dprev + DelD;
        end
    else
        if(Vpv-Vprev)> 0
            D = Dprev + DelD;
        else
            D = Dprev - DelD;
        end
    end
else
    D = Dprev;
end
%new value
Dprev = D;
Pprev = Pvp; 
Vprev = Vpv; 