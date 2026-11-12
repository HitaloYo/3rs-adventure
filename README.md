# 3Rs Adventure

Jogo 2D educativo sobre os **3 Rs da sustentabilidade**: reduzir, reutilizar e reciclar. O jogador percorre áreas temáticas, lê placas, conversa com personagens e cumpre tarefas como recolher o lixo espalhado e separar cada objeto (vidro, metal, papel e plástico) na lixeira certa.

Feito com **Godot 4.4** e **GDScript**.

## Áreas do jogo

- **Tutorial:** movimentação, interação e coleta de objetos.
- **Reduzir:** dentro e fora de casa, com lâmpadas para apagar e avisos de economia.
- **Reutilizar:** objetos que podem ganhar um novo uso.
- **Reciclar:** coleta seletiva, levando cada resíduo à lixeira da sua cor.

## Controles

| Ação | Tecla |
| --- | --- |
| Andar | `W` `A` `S` `D` ou setas |
| Interagir e coletar objetos | `Z` ou `Enter` |

## Como rodar

1. Instale o [Godot 4.4](https://godotengine.org/download) (versão padrão, sem .NET).
2. No Godot, clique em **Importar** e escolha o arquivo `project.godot` deste repositório.
3. Aperte **F5** para jogar.

Na primeira abertura, o Godot reimporta as imagens e os sons, o que leva alguns segundos.

## Estrutura

```
scenes/     cenas das áreas, menu, jogador e caixas de diálogo
scripts/    lógica do jogador, dos objetos colecionáveis e dos diálogos
singleton/  gerenciadores globais (diálogo e áudio)
sprites/    personagens, tilesets e fonte
```

## Créditos

Os sprites de personagens vêm de um pacote de assets gratuito; veja `sprites/characters/README.txt`.
