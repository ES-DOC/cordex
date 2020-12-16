
import os

import xlsxwriter

from lib.utils import logger



def write(ctx):
    """Write topic workbook.

    """
    path = os.getenv('CORDEX_PATH_REPOS_INST')
    path = os.path.join(path, ctx.institution_id)
    path = os.path.join(path, ctx.MIP_ERA)
    path = os.path.join(path, 'models')
    path = os.path.join(path, ctx.source_id)
    if not os.path.isdir(path):
        os.makedirs(path)

    fname = '_'.join([ctx.MIP_ERA, ctx.source_id, ctx.topic_id]).replace("-", "_")
    fname += '.xlsx'
    fpath = os.path.join(path, fname)

    logger.log('generating --> {}'.format(fpath), app='SH')
    ctx.wb = xlsxwriter.Workbook(fpath)
