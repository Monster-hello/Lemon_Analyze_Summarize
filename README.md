# Lemon_Analyze_Summarize
This is the introduction of the whole previous analysis work's pipeline
The main branch was divided into 4 files: Code, DATA, Leipzig, Toolbox, and it still contains an Excel file that I created to mark the missing data of raw behavior scales data.

# Code
In the first step, for Step00, I reconstructed the whole raw data into a new matrix structure to let each participant have a structure to contain his/her EEG and other behavior scales.

For Step01, it is the process of using the fooof-tools(https://github.com/fooof-tools/fooof_mat) to calculate the aperiodic component. fooof_group means it can be calculated by a group (many channels at the same time). 

And Step02 has calculated and summarized the result for each individual. 

Step03 has been used for conducting significant difference analysis between different age groups.

And Step04 is independent of Step01 to 03, it is the step to plot the FOOOF analysis group aperiodic component reconstruction in channel Cz.

# Dependencies

Warning: before running the step01, you should reference the link: https://github.com/fooof-tools/fooof, configure the relevant anaconda environment:

For example: 

It has the following required dependencies:

- numpy
- scipy >= 0.19
  
 There are also optional dependencies, which are not required for model fitting itself, but offer extra functionality:

- matplotlib is needed to visualize data and model fits
- tqdm is needed to print progress bars when fitting many models
- pandas is needed for exporting model fit results to dataframes
- pytest is needed to run the test suite locally

It was recommend using the Anaconda distribution to manage these requirements.

# DATA 
DATA folder was used to store the temporary results of each steps.("The file is too large to upload, consider using Google Drive for backup.） 

# Leipzig 
This folder contains the raw processed eeg data and other behavior scales, it is a zip file which means that you need to unzip it before using.
(It was too big to upload on Git-hub so you can download it on my onedrive link https://mcgill-my.sharepoint.com/:u:/r/personal/chen_liu6_mail_mcgill_ca/Documents/Leipzig.rar?csf=1&web=1&e=nVcZbK)

# Figure
This folder contains all visual images of results

# Toolbox
This folder contains the essential toolbox : fooof_matlab-main (it contains the example files, too) and foof-main(original Python toolbox)

# Missing appendix
This Excel file recods the missing scales of each participants (notes by their number).
