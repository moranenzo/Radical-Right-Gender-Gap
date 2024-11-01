<h1>How to Retrieve Data</h1>

<p>This guide provides the steps to access and transform the European Social Survey (ESS) dataset used in this sociology project. Follow the instructions below to obtain the data in <code>.csv</code> format and, if needed, convert it to <code>SAS</code>.</p>

<h2>Step 1: Download the ESS Data in .csv Format</h2>

<ol>
    <li>Navigate to the <a href="https://www.europeansocialsurvey.org/data/" target="_blank">European Social Survey Data Page</a>.</li>
    <li>Under the “Data” section, locate the survey for the year 2012 (ESS Round 6).</li>
    <li>Go to the “Data Files” section and select the file labeled “ESS6-integrated-Data file, edition 2.5”.</li>
    <li>Click “Login to download data”.</li>
    <li>Log in with a Google account or other option to gain access.</li>
    <li>Select the file in <code>.csv</code> format from the available download options (sav, dta, csv).</li>
</ol>

<h2>Step 2: Convert the Data to SAS Format (Optional)</h2>

<p>For users who need the data in SAS format, follow these steps:</p>

<pre><code>proc import datafile = 'YOUR_PATH/ESS6e02_5.csv'
    out = work.ess
    dbms = CSV replace;
    guessingrows=max;
run;
</code></pre>

<p>To verify the import, you may add:</p>

<pre>
proc freq data=ess;
table cntry;
run;
</pre>

<p>Upon successful import, SAS will confirm with the following log message:</p>

<blockquote>
NOTE: WORK.ESS data set was successfully created.<br>
NOTE: The data set WORK.ESS has 54,673 observations and 625 variables.
</blockquote>

<p>By default, SAS saves the table in the temporary WORK.ESS library.</p>

<h2>Step 3: Save the SAS Commands</h2>
<ol>
    <li>Save these commands in a file named <code>ESS6e02_5.sas</code> before exiting SAS.</li>
    <li>Ensure that the dataset is saved in a non-temporary library for future use.</li>
</ol>
