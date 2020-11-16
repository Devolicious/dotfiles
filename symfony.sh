
alias docgen='read input; if [ -f "bin/console" ]; then bin/console doctrine:generate:entities $input --no-backup; else app/console doctrine:generate:entities $input --no-backup; fi;'

function docexec() {
    if [ -f "bin/console" ];
    then
        bin/console doctrine:migrations:execute $1 --$2 --no-interaction;
    else
        app/console doctrine:migrations:execute $1 --$2 --no-interaction;
    fi;
}


alias docschema='if [ -f "bin/console" ]; then bin/console doctrine:schema:update --force; else app/console doctrine:schema:update --force; fi'
alias docdiff='if [ -f "bin/console" ]; then bin/console doctrine:migrations:diff; else app/console doctrine:migrations:diff; fi'
alias docmigrate='if [ -f "bin/console" ]; then bin/console doctrine:migrations:migrate -n; else app/console doctrine:migrations:migrate -n; fi'
alias symfsym='if [ -f "bin/console" ]; then bin/console assets:install --symlink; else app/console assets:install --symlink; fi'
alias symfdump='if [ -f "bin/console" ]; then bin/console assetic:dump --forks=8; else app/console assetic:dump --forks=8; fi'
