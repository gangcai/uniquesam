import re,sys
sample=sys.argv[1] 
outfile=open(sample+"_unique.sam","w")
i=0
pre_rid=""
pre_infos=[]
unique_counts=0
for line in open(sample+".sam"):
	if re.search("^@",line):
		outfile.write(line)
		continue
	#YT:Z:CP indicates the read was part of a pair and the pair aligned concordantly
	if not re.search("YT:Z:CP",line):
		continue
	items=line.split()
	rid=items[0]
	i+=1
	if i==1:
		pre_rid=rid
		pre_infos.append(line)
		continue
	if rid == pre_rid:
		pre_infos.append(line)
		continue
	if len(pre_infos) == 2:
		unique_counts+=1
		for pre_info in pre_infos:
			outfile.write(pre_info)
	pre_rid=rid
	pre_infos=[line]

#the last one
if len(pre_infos) == 2:
	unique_counts+=1
	for pre_info in pre_infos:
		outfile.write(pre_info)
print("uniquely properly paired:"+ str(unique_counts))
outfile.close()
