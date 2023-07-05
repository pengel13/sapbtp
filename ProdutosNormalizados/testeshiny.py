import pandas as pd    
from pathlib import Path
categorias = pd.read_csv('/home/user/projects/ProdutosNormalizados/db/data/pn-Categoria.csv', sep =',')
print(Path(__file__))
indices = []
def funcao(row):

    indices.append(row[0])
    

categorias.apply(lambda x : funcao(x), axis = 1)
