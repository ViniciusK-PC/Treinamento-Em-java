-- Exercícios

-- 1) Construa aplicações para realizar o CRUD na tabela Estados
-- CRUD = Create, Retrieve, Update, Delete (Inserir, Retornar, Atualizar, Deletar)

-- 2) Pesquise na Internet


#include <stdio.h>
#include <stdlib.h>
#include <libpq-fe.h>

void exit_nicely(PGconn *conn) {
    PQfinish(conn);
    exit(1);
}

int main() {
    const char *conninfo = "dbname=seubanco user=seuusuario password=suasenha";
    PGconn *conn = PQconnectdb(conninfo);

    if (PQstatus(conn) != CONNECTION_OK) {
        fprintf(stderr, "Connection to database failed: %s", PQerrorMessage(conn));
        exit_nicely(conn);
    }

    PGresult *res = PQexec(conn, "SELECT * FROM Estados");
    if (PQresultStatus(res) != PGRES_TUPLES_OK) {
        fprintf(stderr, "SELECT failed: %s", PQerrorMessage(conn));
        PQclear(res);
        exit_nicely(conn);
    }

    int nFields = PQnfields(res);
    for (int i = 0; i < PQntuples(res); i++) {
        for (int j = 0; j < nFields; j++) {
            printf("%s\t", PQgetvalue(res, i, j));
        }
        printf("\n");
    }

    PQclear(res);
    PQfinish(conn);
    return 0;
}

gcc -o exemploPostgres ExemploPostgres.c -lpq

Finalizado