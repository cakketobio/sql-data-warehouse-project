# sql-data-warehouse-project

# 🏗️ SQL Data Warehouse — Projeto de Engenharia de Dados

Projeto de estudo e prática em Engenharia de Dados, desenvolvido com base no tutorial **SQL Data Warehouse from Scratch**, de [Data With Baraa](https://github.com/DataWithBaraa/sql-data-warehouse-project).

O objetivo é compreender e implementar as principais etapas da construção de um Data Warehouse utilizando Microsoft SQL Server, desde a importação de dados brutos até sua transformação em informações organizadas para análises.

## 📌 Sobre o projeto

Um Data Warehouse é um repositório centralizado que integra dados de diferentes fontes, permitindo consultas analíticas e apoiando a tomada de decisões.

Neste projeto, são utilizados dados fictícios de sistemas de CRM (*Customer Relationship Management*) e ERP (*Enterprise Resource Planning*), disponibilizados em arquivos CSV.

O processo utiliza a arquitetura Medallion, organizada em três camadas: Bronze, Silver e Gold.

## 🏛️ Arquitetura de dados

```text
       FONTES DE DADOS
        ┌───────────┐
        │    CRM    │
        │  Arquivos │
        │    CSV    │
        └─────┬─────┘
              │
              ▼
        ┌───────────┐
        │   BRONZE  │
        │ Dados     │
        │ brutos    │
        └─────┬─────┘
              │
              ▼
        ┌───────────┐
        │   SILVER  │
        │ Limpeza e │
        │ tratamento│
        └─────┬─────┘
              │
              ▼
        ┌───────────┐
        │    GOLD   │
        │ Modelo    │
        │ analítico │
        └─────┬─────┘
              │
              ▼
       CONSULTAS SQL
       E ANÁLISES
```

O ERP também fornece dados de origem que são integrados ao processo.

### 🥉 Bronze — Dados brutos

Camada responsável por receber os dados de origem, preservando sua estrutura inicial para permitir o processamento posterior.

### 🥈 Silver — Dados tratados

Camada destinada à limpeza, padronização, validação e integração dos dados, buscando corrigir inconsistências e melhorar sua qualidade.

### 🥇 Gold — Dados para análise

Camada que organiza os dados em modelos analíticos, incluindo tabelas de fatos e dimensões estruturadas conforme o modelo estrela (*Star Schema*).

## 🎯 Objetivos de aprendizagem

- Compreender os fundamentos de Data Warehousing.
- Praticar consultas com SQL e T-SQL.
- Aprender a importar arquivos CSV para o SQL Server.
- Implementar processos ETL (*Extract, Transform, Load*).
- Aplicar técnicas de limpeza e padronização de dados.
- Compreender a modelagem dimensional.
- Desenvolver consultas para analisar clientes, produtos e vendas.
- Documentar a arquitetura, os processos e os testes de qualidade.

## 🛠️ Tecnologias e ferramentas

| Tecnologia | Finalidade |
|---|---|
| Microsoft SQL Server Express | Armazenamento e processamento dos dados |
| SQL / T-SQL | Consultas, criação de tabelas e transformações |
| SQL Server Management Studio (SSMS) | Gerenciamento do banco e execução dos scripts |
| Git e GitHub | Versionamento e documentação do projeto |
| Draw.io | Visualização de diagramas e arquitetura |

## 📂 Estrutura do repositório

A estrutura abaixo segue a organização do repositório original consultado. Os nomes das pastas podem variar conforme a versão utilizada.

```text
sql-data-warehouse-project/
│
├── 00_setup/
│   └── Instruções de configuração do ambiente
│
├── 01_datasets/
│   ├── source_crm/
│   │   └── Arquivos CSV do CRM
│   │
│   └── source_erp/
│       └── Arquivos CSV do ERP
│
├── 02_docs/
│   ├── requirements.md
│   ├── Diagramas de arquitetura
│   ├── Modelagem de dados
│   └── Documentação técnica
│
├── 03_scripts/
│   ├── init_database.sql
│   │
│   ├── bronze/
│   │   └── Scripts de carga dos dados brutos
│   │
│   ├── silver/
│   │   └── Scripts de limpeza e transformação
│   │
│   └── gold/
│       └── Scripts do modelo analítico
│
├── 04_tests/
│   └── Testes de qualidade dos dados
│
├── .gitignore
├── LICENSE
└── README.md
```

## ⚙️ Configuração do ambiente

### 1. Instalar os programas

Instale os seguintes componentes:

- [SQL Server Express](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)
- [SQL Server Management Studio (SSMS)](https://learn.microsoft.com/en-us/ssms/install/install)
- [Git para Windows](https://git-scm.com/download/win), caso deseje clonar o repositório.

### 2. Baixar o projeto

Clone o repositório original utilizando o terminal:

```bash
git clone https://github.com/DataWithBaraa/sql-data-warehouse-project.git
```

Entre na pasta do projeto:

```bash
cd sql-data-warehouse-project
```

### 3. Conectar ao SQL Server

Abra o SSMS e conecte-se à instância local do SQL Server.

Exemplo de configuração para uma instalação local:

- **Tipo de servidor:** Database Engine
- **Nome do servidor:** `localhost\SQLEXPRESS`
- **Autenticação:** Windows Authentication

O nome da instância deve corresponder ao instalado no computador. Se sua instalação utilizar outra instância, ajuste o campo conforme necessário.

### 4. Criar o banco de dados

Abra o arquivo `03_scripts/init_database.sql` e execute-o no SSMS.

Esse script inicializa o banco de dados e os esquemas utilizados pelo projeto. Consulte o próprio arquivo antes de executá-lo para verificar os nomes definidos na versão baixada.

### 5. Configurar os arquivos CSV

Verifique os arquivos disponíveis na pasta `01_datasets`.

Os scripts de carga precisam apontar para os caminhos corretos dos arquivos no computador. Caso necessário, ajuste os caminhos definidos no procedimento de carga da camada Bronze.

### 6. Executar os scripts

Siga a sequência de implementação do projeto:

1. Inicializar o banco de dados.
2. Criar e carregar as tabelas da camada Bronze.
3. Criar e carregar as tabelas tratadas da camada Silver.
4. Criar as estruturas analíticas da camada Gold.
5. Executar os testes de qualidade.
6. Realizar consultas SQL para validar os resultados.

Consulte as instruções da pasta `00_setup` e os scripts da versão baixada antes de executar cada etapa.

## 📊 Resultados esperados

Ao concluir a implementação, espera-se obter:

- Dados de CRM e ERP integrados em um ambiente centralizado.
- Dados tratados e padronizados para consultas.
- Estruturas analíticas organizadas em fatos e dimensões.
- Consultas para investigar comportamento de clientes, desempenho de produtos e tendências de vendas.
- Documentação dos processos e verificações de qualidade.

Os resultados efetivos devem ser registrados após a execução e validação dos scripts.

## 📚 Referências e créditos

Este projeto de estudo é baseado no material educacional disponibilizado por Baraa Khatib Salkini, conhecido como Data With Baraa.

- **Repositório original:** https://github.com/DataWithBaraa/sql-data-warehouse-project
- **Canal no YouTube:** https://www.youtube.com/@DataWithBaraa
- **Tutorial do projeto:** https://www.datawithbaraa.com/projects/sql-data-warehouse

Os créditos pelo material original, pelos conjuntos de dados e pela proposta educacional pertencem ao autor correspondente. Consulte a licença original antes de redistribuir os materiais.

---

**Status:** Em desenvolvimento — ambiente e execução dos scripts em configuração.

**Finalidade:** Estudo acadêmico, prática de SQL e desenvolvimento de conhecimentos em Engenharia de Dados.
