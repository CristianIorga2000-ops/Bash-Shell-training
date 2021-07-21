while [ 1 -eq 1 ]; do
	for process; do
		for id in `pidof $process`; do
			kill $id
			echo Process $process with id $id has been brutally massacred
		done
	done
done
