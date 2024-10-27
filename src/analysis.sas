/* SAS Report - Analyzing the Gender Effect on Radical Right Support in Europe */

/* Define libraries and paths */
ods rtf file="results/summary.docx";
libname thesis "data/";

/* Load data into the working library */
data ess;
    set thesis.ess_data;
run;

/* Create an age group variable */
data ess;
    set ess;
    length age_group $30;
    if yrbrn <= 1962 then age_group = "+50";
    else if 1962 < yrbrn <= 1985 then age_group = "28-49";
    else if 1985 < yrbrn <= 1994 then age_group = "18-27";
run;

/* Format for French political parties */
data ess;
    set ess;
    length french_party $70;
    if prtvtcfr = 2 then french_party = "National Front";
    else if prtvtcfr = 6 then french_party = "Left Front";
    else if prtvtcfr = 9 then french_party = "Socialist Party";
    else if prtvtcfr = 10 then french_party = "UMP";
    else if prtvtcfr = 11 then french_party = "EELV+Modem";
    else if prtvtcfr = 15 then french_party = "Blank";
run;

/* Format for German political parties */
data ess;
    set ess;
    length german_party $80;
    if prtvddel = 7 then german_party = "Far Right";
run;

/* Format for Italian political parties */
data ess;
    set ess;
    length italian_party $150;
    if prtvtbit in (9, 10) then italian_party = "Far Right";
    else italian_party = "Other political stances";
run;

/* Format for gender */
data ess;
    set ess;
    length gender $20;
    if gndr = 1 then gender = "Male";
    else if gndr = 2 then gender = "Female";
run;

/* Analysis: Influence of Age and Distribution of Votes */
title j=c "Influence of Age on Female Votes for French Radical Right";
proc sort data=ess; by age_group; run;
proc gchart data=ess;
    by age_group;
    where gender = "Female";
    hbar french_party;
run; quit;

/* Analysis: Percentage of Votes by Gender */
title j=c "Percentage of Votes for French Parties by Gender";
proc sort data=ess; by gender; run;
proc gchart data=ess;
    by gender;
    pie french_party / explode="National Front" percent=arrow noheading;
run; quit;

/* Analysis of Votes for Radical Right in Europe by Gender */
title "Votes for Radical Right in Germany by Gender";
proc gchart data=ess;
    where prtvddel = 7;
    vbar gender;
run; quit;

title "Votes for Radical Right in France by Gender";
proc gchart data=ess;
    where prtvtcfr = 2;
    vbar gender;
run; quit;

title "Votes for Far Right in Italy by Gender";
proc gchart data=ess;
    where italian_party = "Far Right";
    vbar gender;
run; quit;

/* Format for Education Level */
data ess;
    set ess;
    length edu_level $110;
    if edlvdfr = 7 then edu_level = "Artisan Apprenticeship Certificate";
    else if edlvdfr = 9 then edu_level = "Professional Baccalaureate";
    else if edlvdfr = 10 then edu_level = "Technological Baccalaureate";
    else if edlvdfr = 3 then edu_level = "Primary School Certificate";
    else if edlvdfr = 5 then edu_level = "General Certificate";
    else edu_level = "OTHER";
run;

title j=c "Education Level of Voters for the National Front in 2012";
proc gchart data=ess;
    where prtvtcfr = 2;
    pie edu_level / noheading percent=inside;
run;

/* Variable for hours spent watching politics by women */
data ess;
    set ess;
    if gender = "Female" then tvpol_f = tvpol;
run;

title "Distribution of Hours Women Spend Watching Politics or News on TV";
proc boxplot data=ess;
    plot tvpol_f*french_party / boxstyle=schematic;
    label tvpol_f = "Hours Watching Politics or News";
    label french_party = "French Parties";
run;

ods rtf close;