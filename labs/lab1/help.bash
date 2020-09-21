#!/bin/bash

echo "-----------------------------------------------"
echo -e "\033[43m______________________HELP____________________\e[0m"
echo "There are 8 commands at your desposal:	     "
echo -e "1. \e[44mcalc:\e[0m calculator			     "
echo -e " \033[33mgoes with 3 arguments:\e[0m                       "
echo "		1. sum/sub/mul/div		     "
echo "		     for (+)/(-)/(*)/(/) operations  "
echo "		2. value 1			     "
echo "		3. value 2			     "
echo -e "2. \e[44msearch:\e[0m recursive search through the 	     "
echo "		 contents of file in a given	     "
echo "		 directory			     "
echo -e " \033[33mgoes with 2 arguments:\e[0m			     "
echo "		1. directory			     "
echo "		2. regular expression		     "
echo -e "3. \e[44mreverse:\e[0m in reversed order writes the	     "
echo "		  contents of the file		     "
echo -e " \033[33mgoes with 2 arguments:\e[0m			     "
echo "		1. source file			     "
echo "		2. result file			     "
echo -e "4. \e[44mstrlen:\e[0m prints the number of characters in  "
echo "		 line				     "
echo -e " \033[33mgoes with 1 argument:\e[0m			     "
echo "		1. string			     "
echo -e "5. \e[44mlog:\e[0m prints lines with warnings and info    "
echo "        from /var/log/anaconda/X.log file      "
echo -e "6. \e[44mexit:\e[0m terminating application with the      "
echo "	       given exit code (default 0)	     "
echo -e " \033[33mgoes with 1 argument (or 0 with def. value):\e[0m "
echo "		1. exit code			     "
echo -e "7. \e[44minteractive:\e[0m launches interactive mode      "
echo -e "8. \e[44mhelp:\e[0m prints help info			     "
echo "_______________________________________________"
echo -e "\e[36m0 - everything is ok"
echo -e "1 - something went wrong\e[0m"
