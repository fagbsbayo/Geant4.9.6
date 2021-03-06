//
// ********************************************************************
// * License and Disclaimer                                           *
// *                                                                  *
// * The  Geant4 software  is  copyright of the Copyright Holders  of *
// * the Geant4 Collaboration.  It is provided  under  the terms  and *
// * conditions of the Geant4 Software License,  included in the file *
// * LICENSE and available at  http://cern.ch/geant4/license .  These *
// * include a list of copyright holders.                             *
// *                                                                  *
// * Neither the authors of this software system, nor their employing *
// * institutes,nor the agencies providing financial support for this *
// * work  make  any representation or  warranty, express or implied, *
// * regarding  this  software system or assume any liability for its *
// * use.  Please see the license in the file  LICENSE  and URL above *
// * for the full disclaimer and the limitation of liability.         *
// *                                                                  *
// * This  code  implementation is the result of  the  scientific and *
// * technical work of the GEANT4 collaboration.                      *
// * By using,  copying,  modifying or  distributing the software (or *
// * any work based  on the software)  you  agree  to acknowledge its *
// * use  in  resulting  scientific  publications,  and indicate your *
// * acceptance of all terms of the Geant4 Software license.          *
// ********************************************************************
//
//
// GEANT4 tag $Name: not supported by cvs2svn $
//
//
// GEANT4 physics class: G4QuasiFreeRatios -- header file
// M.V. Kossov, ITEP(Moscow), 24-OCT-01
// The last update: M.V. Kossov, CERN/ITEP (Moscow) 28-Oct-2011
// ----------------------------------------------------------------------
// Short description: Provides percentage of quasi-free and quasi-elastic
// reactions in the inelastic reactions.
// ----------------------------------------------------------------------

#ifndef G4QuasiFreeRatios_h
#define G4QuasiFreeRatios_h 1

#include "globals.hh"
#include "G4ios.hh"
#include "Randomize.hh"
#include <vector>
#include "G4QPDGCode.hh"
#include "G4QHadron.hh"
#include "G4QFreeScattering.hh"
#include "G4QProtonElasticCrossSection.hh"
#include "G4QNeutronElasticCrossSection.hh"


class G4QuasiFreeRatios
{
 protected:

  G4QuasiFreeRatios();                 // Constructor

 public:

  ~G4QuasiFreeRatios();                 // Destructor

  static G4QuasiFreeRatios* GetPointer(); // Gives a pointer to this singletone

  // Pair(QuasiFree/Inelastic,QuasiElastic/QuasiFree)
  std::pair<G4double,G4double> GetRatios(G4double pIU, G4int prPDG, G4int tgZ, G4int tgN);
  // ChargeExchange/QuasiElastic factor pair<for protons (Z), for neutrons(N)>
  std::pair<G4double,G4double> GetChExFactor(G4double pIU, G4int pPDG, G4int Z, G4int N);
  // scatter (pPDG,p4M) on a virtual nucleon (NPDG,N4M), result: final pair(newN4M,newp4M)
  // if(newN4M.e()==0.) - below threshold, XS=0, no scattering of the projectile happened
  std::pair<G4LorentzVector,G4LorentzVector> Scatter(G4int NPDG, G4LorentzVector N4M,
                                                     G4int pPDG, G4LorentzVector p4M);
  // ChExer (pPDG,p4M) on a virtual nucleon (NPDG,N4M), result: final pair(newN4M,newp4M)
  // if(newN4M.e()==0.) - keep projectile, XS=0, no interaction of the progectile happened
  // User should himself change the charge (PDG) (e.g. pn->np, pi+n->pi0p, pi-p->pi0n etc.)
  // Recepy: change target n to p or taget p to n and conserve enrgy, changing projectile
  // Do not use for the nucleon, as it is already included in quasielastic, and for pi0.
  std::pair<G4LorentzVector,G4LorentzVector> ChExer(G4int NPDG, G4LorentzVector N4M,
                                                    G4int pPDG, G4LorentzVector p4M);
  // Mean hN El and Tot XS(IU) for the isotopic (Z,N): on p -> (Z=1,N=0), on n -> (Z=0,N=1)
  std::pair<G4double,G4double> GetElTot(G4double pIU, G4int hPDG, G4int Z, G4int N); //(IU)

  // Calculate ChEx/El ratio coefficient (p is in independent units, (Z,N) is a target)
  G4double ChExElCoef(G4double p, G4int Z, G4int N, G4int pPDG);

  // For hadron PDG with momentum Mom (GeV/c) on F(p/n) calculate <sig_el,sig_tot> pair(mb)
  // F=true corresponds to the Nroton target, F=false corresponds to the Proton target
  std::pair<G4double,G4double> GetElTotXS(G4double Mom, G4int PDG, G4bool F);//<sigEl,sigT>

 private:
  // These working member functions are in CHIPS units and must not be used externally
  G4double GetQF2IN_Ratio(G4double TotCS_mb, G4int A); // QuasiFree/Inelastic (fast)
  G4double CalcQF2IN_Ratio(G4double TCSmb, G4int A); // R=QuasuFree/Inelastic (sig_t in mb)

 // Body
 private:
  G4QFreeScattering* QFreeScat;         // Source of quasi-free scattering XS
  static std::vector<G4double*> vT;     // Vector of pointers to LinTable
  static std::vector<G4double*> vL;     // Vector of pointers to LogTable
};
#endif
