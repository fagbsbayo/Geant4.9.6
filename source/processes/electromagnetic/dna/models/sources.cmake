#------------------------------------------------------------------------------
# sources.cmake
# Module : G4emlowenergy
# Package: Geant4.src.G4processes.G4electromagnetic.G4emlowenergy
#
# Sources description for a library.
# Lists the sources and headers of the code explicitely.
# Lists include paths needed.
# Lists the internal granular and global dependencies of the library.
# Source specific properties should be added at the end.
#
# Generated on : 24/9/2010
#
# $Id: sources.cmake,v 1.4 2010-11-15 08:24:43 gcosmo Exp $
#
#------------------------------------------------------------------------------

# List external includes needed.
include_directories(${CLHEP_INCLUDE_DIRS})

# List internal includes needed.
include_directories(${CMAKE_SOURCE_DIR}/source/geometry/management/include)
include_directories(${CMAKE_SOURCE_DIR}/source/global/HEPGeometry/include)
include_directories(${CMAKE_SOURCE_DIR}/source/global/HEPNumerics/include)
include_directories(${CMAKE_SOURCE_DIR}/source/global/HEPRandom/include)
include_directories(${CMAKE_SOURCE_DIR}/source/global/management/include)
include_directories(${CMAKE_SOURCE_DIR}/source/intercoms/include)
include_directories(${CMAKE_SOURCE_DIR}/source/materials/include)
include_directories(${CMAKE_SOURCE_DIR}/source/particles/bosons/include)
include_directories(${CMAKE_SOURCE_DIR}/source/particles/hadrons/barions/include)
include_directories(${CMAKE_SOURCE_DIR}/source/particles/hadrons/ions/include)
include_directories(${CMAKE_SOURCE_DIR}/source/particles/hadrons/mesons/include)
include_directories(${CMAKE_SOURCE_DIR}/source/particles/leptons/include)
include_directories(${CMAKE_SOURCE_DIR}/source/particles/management/include)
include_directories(${CMAKE_SOURCE_DIR}/source/processes/cuts/include)
include_directories(${CMAKE_SOURCE_DIR}/source/processes/electromagnetic/standard/include)
include_directories(${CMAKE_SOURCE_DIR}/source/processes/electromagnetic/lowenergy/include)
include_directories(${CMAKE_SOURCE_DIR}/source/processes/electromagnetic/utils/include)
include_directories(${CMAKE_SOURCE_DIR}/source/processes/management/include)
include_directories(${CMAKE_SOURCE_DIR}/source/processes/electromagnetic/dna/utils/include)
include_directories(${CMAKE_SOURCE_DIR}/source/processes/electromagnetic/dna/molecules/management/include)
include_directories(${CMAKE_SOURCE_DIR}/source/processes/electromagnetic/dna/molecules/types/include)
include_directories(${CMAKE_SOURCE_DIR}/source/processes/electromagnetic/dna/management/include)
include_directories(${CMAKE_SOURCE_DIR}/source/track/include)

#
# Define the Geant4 Module.
#
include(Geant4MacroDefineModule)
GEANT4_DEFINE_MODULE(NAME G4emdna-models
    HEADERS
        G4DNABornExcitationModel.hh
        G4DNABornIonisationModel.hh
        G4DNAChampionElasticModel.hh
        G4DNASmoluchowskiReactionModel.hh
        G4DNADingfelderChargeDecreaseModel.hh
        G4DNADingfelderChargeIncreaseModel.hh
        G4DNAEmfietzoglouExcitationModel.hh
        G4DNAMeltonAttachmentModel.hh
        G4DNAMillerGreenExcitationModel.hh
        G4DNAMolecularReaction.hh
        G4DNAMolecularStepByStepModel.hh
        G4DNAMoleculeEncounterStepper.hh
        G4DNARuddIonisationExtendedModel.hh
        G4DNARuddIonisationModel.hh
        G4DNASancheExcitationModel.hh
        G4DNASancheSolvatationModel.hh
        G4DNAScreenedRutherfordElasticModel.hh
        G4DNATransformElectronModel.hh
    SOURCES
        G4DNABornExcitationModel.cc
        G4DNABornIonisationModel.cc
        G4DNAChampionElasticModel.cc
        G4DNASmoluchowskiReactionModel.cc
        G4DNADingfelderChargeDecreaseModel.cc
        G4DNADingfelderChargeIncreaseModel.cc
        G4DNAEmfietzoglouExcitationModel.cc
        G4DNAMeltonAttachmentModel.cc
        G4DNAMillerGreenExcitationModel.cc
        G4DNAMolecularReaction.cc
        G4DNAMolecularStepByStepModel.cc
        G4DNAMoleculeEncounterStepper.cc
        G4DNARuddIonisationExtendedModel.cc
        G4DNARuddIonisationModel.cc
        G4DNASancheExcitationModel.cc
        G4DNASancheSolvatationModel.cc
        G4DNAScreenedRutherfordElasticModel.cc
        G4DNATransformElectronModel.cc
    GRANULAR_DEPENDENCIES
        G4baryons
        G4bosons
        G4cuts
        G4emlowenergy
        G4emstandard
        G4emutils
        G4geometrymng
        G4globman
        G4hepnumerics
        G4intercoms
        G4ions
        G4leptons
        G4materials
        G4mesons
        G4partman
        G4procman
        G4track
        G4emdna-man
        G4emdna-molman
        G4emdna-moltypes
        G4emdna-utils
    GLOBAL_DEPENDENCIES
        G4geometry
        G4global
        G4intercoms
        G4materials
        G4particles
        G4track
    LINK_LIBRARIES
)

# List any source specific properties here

