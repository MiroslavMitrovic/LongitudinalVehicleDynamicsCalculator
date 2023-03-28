function [ I0r ] = DataInput2
f_V_Memax=I0Analysis.f_V_Memax;
f_V_Memaxizab=f_V_Memax(1,2);
a_max=I0Analysis.a_max;
a_maxizab=a_max(1,2);

I0r.i0izab=i0izab;
I0r.Fomaxi0izab=Fomaxi0izab;
I0r.omega_Me_maxizab=omega_Me_maxizab;
I0r.Vmaxi0izab=Vmaxi0izab;
I0r.V_Me_maxizab=V_Me_maxizab;
I0r.Do_max_i0izab=Do_max_i0izab;
I0r.deltaizab=deltaizab;
I0r.f_V_Memaxizab=f_V_Memaxizab;
I0r.a_maxizab=a_maxizab;
end

