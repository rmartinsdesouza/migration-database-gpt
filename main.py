from dotenv import load_dotenv
import os
import openai
import nltk
nltk.download('punkt')  # Certifique-se de ter o pacote punkt baixado
from nltk.tokenize import word_tokenize
from time import sleep

load_dotenv()

base_path = os.path.dirname(__file__)
source_path = os.path.join(base_path, 'source')
destination_path = os.path.join(base_path, 'destination')

# Configurar sua chave de API da OpenAI
openai.api_key = os.environ.get('GPT_KEY')

def translate_openai(text, max_token):
# Fazer a solicitação à API do GPT-3 para obter a conversão
  response = openai.Completion.create(
      engine="davinci",  # Pode usar "curie" em vez de "davinci" também      
      prompt=text,
      max_tokens=max_token,  # Definir o número máximo de tokens na resposta
      stop=None  # Deixe a resposta continuar até o final
  )

  # Extrair a resposta gerada pela API
  # resposta_convertida = resposta.choices[0].text.strip()
  return response

# Cria um lista de todos os arquivos
files = os.listdir(source_path)
# Le todos os arquivos
for file in files:
  with open(os.path.join(source_path, file), mode="r") as buff:
    # Divide o texto em tokens usando NLTK
    tokens = word_tokenize(buff.read())
    # Conta o número de tokens
    num_tokens = len(tokens)
    # Cria mensagem para o prompt
    start_mensagem = 'Por favor converta o codigo ORACLE para uma sintaxe compativel com Microsoft SQL Server\n'
    # Uni o prompt com a sintaxe
    source_sql_text = start_mensagem + buff.read()
    # Solicita a 
    text_source_dest = translate_openai(source_sql_text, num_tokens + 10)
    # print(f"text_source_dest:{text_source_dest}")
    #Write files
    with open(os.path.join(destination_path,file), mode="w") as file_dest:
        file_dest.write(text_source_dest)
    #Aguarda 30s para consulta GPT
    sleep(30)
