"""
.. module:: list.py
   :license: GPL/CeCIL
   :platform: Unix, Windows
   :synopsis: List set of participating institutes.

.. moduleauthor:: Mark Conway-Greenslade <momipsl@ipsl.fr>

"""
from lib.utils import vocabs
from lib.utils import logger


def _main():
    """Main entry point.

    """
    for i in vocabs.get_institutes():
        logger.log(i.canonical_name)


# Main entry point.
if __name__ == '__main__':
    _main()
