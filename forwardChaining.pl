has_symptom(flu, fever).
has_symptom(flu, cough).
has_symptom(flu, headache).
has_symptom(cold, runny_nose).
has_symptom(cold, sore_throat).
has_symptom(cold, cough).
has_symptom(covid, fever).
has_symptom(covid, cough).
has_symptom(covid, shortness_of_breath).
has_symptom(malaria, fever).
has_symptom(malaria, chills).
has_symptom(malaria, headache).

:- dynamic has_symptom/2.

% Rules for diagnosis using forward chaining
diagnose(Patient, flu) :-
    has_symptom(Patient, fever),
    has_symptom(Patient, cough),
    has_symptom(Patient, headache).

diagnose(Patient, cold) :-
    has_symptom(Patient, runny_nose),
    has_symptom(Patient, sore_throat),
    has_symptom(Patient, cough).

diagnose(Patient, covid) :-
    has_symptom(Patient, fever),
    has_symptom(Patient, cough),
    has_symptom(Patient, shortness_of_breath).

diagnose(Patient, malaria) :-
    has_symptom(Patient, fever),
    has_symptom(Patient, chills),
    has_symptom(Patient, headache).

forward_chain(Patient) :-
    diagnose(Patient, Disease),
    assertz(diagnosed(Patient, Disease)), % Add to facts the disease diagnosis
    write('Patient has been diagnosed with: '),
    write(Disease), nl.

% how to run

% assertz(has_symptom(p1, fever)).
% assertz(has_symptom(p1, chills)).
% assertz(has_symptom(p1, headache)).
% forward_chain(p1).
