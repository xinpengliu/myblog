#!/bin/bash
taskpath="/opt/ltp/.tasks/words"

for ((i=1; i<=365; i++))
do
	filepath=`ls ${taskpath}/task_day${i}_* 2> /dev/null`
	if [[ ${filepath} == '' ]]
	then
			continue;
  fi
	echo ${filepath}
	break;
done

if [[ ${filepath} != '' ]]
then
	filename=`echo ${filepath##*/}`;
#	echo ${filepath};
#	echo ${filename};
	echo  "come on,daniel!"|mutt -s "${filename}" 9999@qq.com -a ${filepath}
	#rm ${filepath};
else
#	echo "no taskfile!";
	echo  "come on,daniel!"|mutt -s "warning:no taskfile!" 9999@qq.com -a ${filepath}
fi
