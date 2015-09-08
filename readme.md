# Docker SVN Server

Run a Subversion server for testing purposes.

This is a `svnserve` server with anonymous write access available at
`svn://localhost`.

For example, this is useful for learning [git-svn][git-svn] so that you never
have to deal with SVN.

## Usage

Build it:

    docker build -t paulnechifor/svn-server .

Run it:

    docker run -p 3690:3690 --rm paulnechifor/svn-server

This runs it in the foreground. Everything will be deleted once you stop it with
Ctrl+C.

Test that it works with:

    svn info svn://localhost
    svn co svn://localhost repo

If you need to preserve the repo, just map `/svn`:

    docker run -p 3690:3690 -v $PWD/svn:/svn --rm paulnechifor/svn-server

## License

MIT

[git-svn]: https://git-scm.com/book/en/v1/Git-and-Other-Systems-Git-and-Subversion
