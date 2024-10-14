# Gerenciador de Tarefas em Haskell

Este é um projeto simples de uma **to-do list** (gerenciador de tarefas) desenvolvido em Haskell, criado com o objetivo de praticar conceitos de programação funcional. Foi feito utilizando o template **"simple"** do Stack, sem persistência de dados (as tarefas são mantidas apenas em memória). O usuário pode adicionar tarefas, visualizar suas tarefas ou marcar tarefas como completas.

## Funcionalidades

- **Criar tarefas**: Adicione novas tarefas com um ID único, nome, descrição e status de conclusão.
- **Listar tarefas**: Veja todas as tarefas que você criou.
- **Marcar tarefas como completas**: Marque tarefas específicas como concluídas.

## Estrutura do Projeto

O código está organizado da seguinte forma:

```sh
src/ 
├── Main.hs 
├── Task.hs 
└── TaskManager.hs
```

### Arquivos

- **`Main.hs`**: Este arquivo lida com a entrada e saída do programa. Ele contém o código responsável por:
  - Exibir o menu de opções ao usuário.
  - Receber e tratar a entrada do usuário.
  - Manipular a lista de tarefas.
  - Tratar algumas exceções relacionadas à entrada do usuário.

- **`Task.hs`**: Aqui está definida a estrutura de uma **Task** (ou tarefa), que consiste em:
  - **ID**: Identificador único da tarefa.
  - **Nome**: Nome da tarefa.
  - **Descrição**: Detalhes da tarefa.
  - **Status**: Indicador se a tarefa está completa ou não.

- **`TaskManager.hs`**: Este arquivo contém as funções principais que operam sobre as tarefas, incluindo:
  - Criar uma nova tarefa.
  - Adicionar uma tarefa à lista.
  - Marcar uma tarefa como completa.
  - Gerenciar a lista de tarefas.

## Dependências

As dependências do projeto estão especificadas no arquivo `task-manager.cabal`, gerado automaticamente pelo template **Stack**.

## Como Rodar o Projeto

1. Certifique-se de ter o Stack instalado. Se ainda não tiver, instale-o seguindo as instruções [aqui](https://docs.haskellstack.org/en/stable/README/).
2. Clone este repositório e navegue até o diretório do projeto.
3. Execute os seguinte comandos para compilar e rodar o projeto:

```bash
stack build
stack run
```

Este projeto é uma implementação simples com fins de estudo, sem banco de dados ou persistência de dados entre execuções.