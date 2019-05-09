#!/bin/bash
for sql in *.sql.gz; do
        mv "$sql" "$(basename "$sql" .sql.gz).sql.gz.old"
done
for dump in *.dump; do
        mv "$dump" "$(basename "$dump" .dump).dump.old"
done