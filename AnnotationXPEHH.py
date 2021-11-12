import pandas as pd

# importing numpy as np
import numpy as np

# dictionary of lists
dict = pd.read_csv("./Top1_SSM.csv")

# creating a dataframe from dictionary
df = pd.DataFrame(dict)

df = df.rename(index=lambda x: str(x))

dict2 = pd.read_csv("./ExtremeSSM.csv")

# creating a dataframe from dictionary
df2 = pd.DataFrame(dict2)

df2 = df2.rename(index=lambda x: str(x))

for i in range(len(df)):

    largest_score = 0
    largest_position = 0
    for j in range(len(df2)):
        if (df2["Position"][j] > df["Start Position"][i] and df2["Position"][j] < df["End Position"][i]):
            if (abs(df2["Score"][j]) > abs(largest_score)):
                largest_score = df2["Score"][j]
                largest_position = df2["Position"][j]

    print(largest_score)
    print(largest_position)

    df["Top SNP (position|XPEHH)"][i] = str(largest_position) + '|' + str(largest_score)

    loc = "./JKNSSM_Annotation"
    dict_list = {}
    with open(loc) as f:
        for line in f:
            temp = line.split('\t')
            temp[3] = temp[3].strip()
            if (temp[0] == "chr" + str(df["Chromosome"][i])):
                if ((int(temp[1]) > int(df["Start Position"][i]) and int(temp[1]) < int(df["End Position"][i])) or (
                        int(temp[2]) > int(df["Start Position"][i]) and int(temp[2]) < int(df["End Position"][i]))):
                    if (temp[3] in dict_list):
                        if (int(temp[2]) - int(temp[1]) > dict_list[temp[3]][1] - dict_list[temp[3]][0]):
                            dict_list[temp[3]][0] = int(temp[1])
                            dict_list[temp[3]][1] = int(temp[2])
                    else:
                        dict_list[temp[3]] = [int(temp[1]), int(temp[2])]

    anno_genes = []
    for dict in dict_list:
        anno_genes.append(dict + '|' + str(dict_list[dict][0]) + '|' + str(dict_list[dict][1]))

    df["Annotated genes"][i] = ""

    length_anno = len(anno_genes)
    if length_anno > 0:
        for a in range(length_anno):
            if (a == length_anno - 1):
                df["Annotated genes"][i] += anno_genes[a]
            else:
                df["Annotated genes"][i] = df["Annotated genes"][i] + anno_genes[a] + ', '
    else:
        df["Annotated genes"][i] = "-"

df.to_csv (r'./Result_SSM.csv', index = False, header=True)

#Credit: Rickho886
