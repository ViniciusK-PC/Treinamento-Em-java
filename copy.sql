// 1) Construa aplicações para realizar o CRUD na tabela Estados
// CRUD = Create, Retrieve, Update, Delete (Inserir, Retornar, Atualizar, Deletar)

// 2) Pesquise na Internet de códigos que usam C para acessar outros
// bancos


// CREATE TABLE Estados (
//     id INTEGER PRIMARY KEY AUTOINCREMENT,
//     nome TEXT NOT NULL,
//     sigla TEXT NOT NULL
// )


// #include <stdio.h>
// #include <sqlite3.h>
// #include <stdlib.h>
// #include <string.h>

// void criarEstado(sqlite3 *db, const char *nome, const char *sigla) {
//     char *errMsg = 0;
//     char sql[256];
//     snprintf(sql, sizeof(sql), "INSERT INTO Estados (nome, sigla) VALUES ('%s', '%s');", nome, sigla);

//     if (sqlite3_exec(db, sql, 0, 0, &errMsg) != SQLITE_OK) {
//         fprintf(stderr, "Erro ao inserir estado: %s\n", errMsg);
//         sqlite3_free(errMsg);
//     } else {
//         printf("Estado inserido com sucesso!\n");
//     }
// }

// void listarEstados(sqlite3 *db) {
//     char *errMsg = 0;
//     char sql[] = "SELECT * FROM Estados;";
//     sqlite3_stmt *stmt;

//     if (sqlite3_prepare_v2(db, sql, -1, &stmt, 0) == SQLITE_OK) {
//         printf("ID | Nome             | Sigla\n");
//         printf("--------------------------------\n");
//         while (sqlite3_step(stmt) == SQLITE_ROW) {
//             int id = sqlite3_column_int(stmt, 0);
//             const unsigned char *nome = sqlite3_column_text(stmt, 1);
//             const unsigned char *sigla = sqlite3_column_text(stmt, 2);
//             printf("%2d | %-16s | %-2s\n", id, nome, sigla);
//         }
//         sqlite3_finalize(stmt);
//     } else {
//         fprintf(stderr, "Erro ao listar estados: %s\n", sqlite3_errmsg(db));
//     }
// }

// void atualizarEstado(sqlite3 *db, int id, const char *novoNome, const char *novaSigla) {
//     char *errMsg = 0;
//     char sql[256];
//     snprintf(sql, sizeof(sql), "UPDATE Estados SET nome = '%s', sigla = '%s' WHERE id = %d;", novoNome, novaSigla, id);

//     if (sqlite3_exec(db, sql, 0, 0, &errMsg) != SQLITE_OK) {
//         fprintf(stderr, "Erro ao atualizar estado: %s\n", errMsg);
//         sqlite3_free(errMsg);
//     } else {
//         printf("Estado atualizado com sucesso!\n");
//     }
// }

// void deletarEstado(sqlite3 *db, int id) {
//     char *errMsg = 0;
//     char sql[128];
//     snprintf(sql, sizeof(sql), "DELETE FROM Estados WHERE id = %d;", id);

//     if (sqlite3_exec(db, sql, 0, 0, &errMsg) != SQLITE_OK) {
//         fprintf(stderr, "Erro ao deletar estado: %s\n", errMsg);
//         sqlite3_free(errMsg);
//     } else {
//         printf("Estado deletado com sucesso!\n");
//     }
// }

// int main() {
//     sqlite3 *db;
//     if (sqlite3_open("estados.db", &db)) {
//         fprintf(stderr, "Erro ao abrir banco de dados: %s\n", sqlite3_errmsg(db));
//         return 1;
//     }

//     printf("Banco de dados conectado.\n");

//     // Funções CRUD
//     criarEstado(db, "São Paulo", "SP");
//     listarEstados(db);
//     atualizarEstado(db, 1, "Rio de Janeiro", "RJ");
//     listarEstados(db);
//     deletarEstado(db, 1);
//     listarEstados(db);

//     sqlite3_close(db);
//     return 0;
// }
