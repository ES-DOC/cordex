"""
.. module:: github_repos_sync.py
   :license: GPL/CeCIL
   :platform: Unix, Windows
   :synopsis: Synchronizes CORDEXP institutional GitHub repos.

.. moduleauthor:: Mark A. Conway-Greenslade


"""
import pyessv

from lib.utils import github
from lib.utils import vocabs



def _main():
    """Main entry point.

    """
    # Set repos for creation / deletion.
    institutes = [i.canonical_name for i in vocabs.get_institutes()]
    repos = github.get_repos()
    repos_to_create = set(institutes).difference(set(repos.keys()))

    # Instantiate new repos.
    for institute in repos_to_create:
        github.create_repo(institute)


# Main entry point.
if __name__ == '__main__':
    _main()
