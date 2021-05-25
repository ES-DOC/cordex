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



# Set of regional domains run in support of project.
_DOMAINS = pyessv.COPERNICUS.cordexp.domain

# Set of participating institutes.
_INSTITUTIONS = pyessv.COPERNICUS.cordexp.institution_id

# Set of models run in support of project.
_MODELS = pyessv.COPERNICUS.cordexp.rcm_model

# Set of model topics to be documented.
_TOPICS = pyessv.ESDOC.cordexp.model_topic



def get_domains():
    """Returns set of domains to be processed.

    """
    return _DOMAINS


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


def get_models_by_institution(institution_id=None):
    """Returns set of rcm-models to be processed filtered by institute.

    """
    result = []
    for model in get_models():
        if model.data["institution"] == institution_id.canonical_name:
            result.append(model)

    return result


def get_topics():
    """Returns set of topics to be documented.

    """
    return _TOPICS


def yield_topics(institution_id):
    """Yields model topics.
    
    """
    for i in get_institutes(institution_id):
        for m in get_models_by_institution(i):
            for t in get_topics():
                for d in get_domains():    
                    yield i, m, t, d


def yield_domains(institution_id):
    """Yields model topics.
    
    """
    for i in get_institutes(institution_id):
        for d in get_domains():    
            for m in get_models_by_institution(i):
                yield (i, d, m, get_topics())
