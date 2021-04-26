"""
.. module:: pyessv.utils.logger.py
   :copyright: Copyright "December 01, 2016", IPSL
   :license: GPL/CeCIL
   :platform: Unix, Windows
   :synopsis: Package logging utility functions.

.. moduleauthor:: Mark Conway-Greenslade <momipsl@ipsl.fr>


"""
import os

import pyessv



# Set of participating institutes.
_INSTITUTIONS = pyessv.COPERNICUS.cordexp.institution_id

# Set of models run in support of project.
_MODELS = pyessv.ECMWF.c3s_cordex.rcm_model

# Set of model topics to be documented.
_TOPICS = pyessv.ESDOC.cordexp.model_topic


def get_institute(institution_id):
    """Returns institute to be processed.

    """
    return _INSTITUTIONS[institution_id]


def get_institutes(institution_id=None):
    """Returns set of institutes to be processed.

    """
    if institution_id in (None, '', 'all'):
        return _INSTITUTIONS
    
    return [get_institute(institution_id)]


def get_model(model_id):
    """Returns rcm-model to be processed.

    """
    return _MODELS[model_id]


def get_models(model_id=None):
    """Returns set of rcm-models to be processed.

    """
    if model_id in (None, '', 'all'):
        return _MODELS
    
    return [get_model(model_id)]


def get_models_by_institute(institution_id=None):
    """Returns set of rcm-models to be processed filtered by institute.

    """
    result = []
    for model in get_models():
        if model.raw_name.split("-")[0] == institution_id.raw_name:
            result.append(model)

    return result


def get_topics():
    """Returns set of topics to be documented.

    """
    return _TOPICS
