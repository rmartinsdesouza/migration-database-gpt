# Migration Oracle to MSSQL
Este e um exemplo de ETL utilizando inteligência artificial do chat-gpt, o script foi produzido com a liguagem Python, onde o diretório `source` contém os objetos de banco de dados de origem, o mesmo possuim objetos do tipo `tabelas`, `procedure` e `triggers`. E por meio da extração, transformação e carga, os códigos de criação dos objetos são convertidos automaticamente para um formato compativel com Microsoft SQL Server e gravados no diretório `destination`.

![Oracle](https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white)
![MicrosoftSQLServer](https://img.shields.io/badge/Microsoft%20SQL%20Server-CC2927?style=for-the-badge&logo=microsoft%20sql%20server&logoColor=white)
![ChatGPT](https://img.shields.io/badge/chatGPT-74aa9c?style=for-the-badge&logo=openai&logoColor=white)
![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)
![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)

## Como rodar o projeto
1. Baixe o repositório
    ```sh
    $git clone git@github.com:rmartinsdesouza/migration-database-gpt.

    $cd migration-database-gpt/
    ```
1. Abra no VSCode ou no editor de sua preferência
    ```sh
    $code .
    ```
1. Cria um ambiente virtual
    ```sh
    $python -m venv dio-etl-gpt

    $source dio-etl-gpt/Scripts/activate
    ```
1. Instale as dependência do projeto
    ```sh
    $pip install -r requirements.txt
    ```
1. Crie o arquivo `.env` seguindo o padrão do `.env.example` e adicione a key
    ```sh
    $mv .env.example .env
    ```
1. Execute o projeto através do arquivo `main.py`    
    ```sh
    $python main.py
    ```
