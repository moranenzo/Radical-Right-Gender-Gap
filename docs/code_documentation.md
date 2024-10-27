<h1>Code Documentation</h1>

<p>This document provides explanations for key sections of the SAS code in <code>src/analysis.sas</code>.</p>

<h2>Code Sections</h2>

<ol>
    <li><strong>Library Definition</strong>:
        <ul>
            <li>The library <code>thesis</code> is created to store and access data files located in the <code>data/</code> folder.</li>
        </ul>
    </li>
    <li><strong>Data Preparation</strong>:
        <ul>
            <li><code>age_group</code> variable groups individuals by age, based on birth year.</li>
            <li><code>french_party</code>, <code>german_party</code>, and <code>italian_party</code> recode political parties for easier analysis.</li>
        </ul>
    </li>
    <li><strong>Key Analysis Sections</strong>:
        <ul>
            <li><strong>Age Influence on Voting</strong>: Examines voting preferences by age group and gender.</li>
            <li><strong>Voting by Gender</strong>: Calculates percentage distribution of votes by gender for radical right parties.</li>
            <li><strong>Education and Voting</strong>: Analyzes the education level of voters for radical right parties.</li>
        </ul>
    </li>
    <li><strong>Visualization</strong>:
        <ul>
            <li><code>gchart</code> and <code>boxplot</code> procedures are used for creating charts that visualize voting patterns.</li>
        </ul>
    </li>
</ol>

<p>Refer to the comments within <code>analysis.sas</code> for more in-depth explanations on each step.</p>