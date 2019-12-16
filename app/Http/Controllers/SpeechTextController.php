<?php
namespace App\Http\Controllers;

# Imports the Google Cloud client library
use Google\Cloud\Speech\V1\SpeechClient;
use Google\Cloud\Speech\V1\RecognitionAudio;
use Google\Cloud\Speech\V1\RecognitionConfig;
use Google\Cloud\Speech\V1\RecognitionConfig\AudioEncoding;
use Google\Cloud\Language\LanguageClient;

Class SpeechTextController extends Controller
{

    public function index()
    {

        # The name of the audio file to transcribe
                $audioFile = '/var/www/html/step-app/listening.mp3';

        # get contents of a file into a string
                $content = file_get_contents($audioFile);



        # Imports the Google Cloud client library

        //putenv('GOOGLE_APPLICATION_CREDENTIALS="/var/www/html/step-app/Google-Api-Stagings-2fa417dce920.json"'); //your path to file of cred
        //$client->useApplicationDefaultCredentials();
        # Your Google Cloud Platform project ID
        $projectId = 'striking-ruler-261614'; //your project name


        # set string as audio content
                $audio = (new RecognitionAudio())
                    ->setContent($content);

        # The audio file's encoding, sample rate and language
                $config = new RecognitionConfig([
                    'encoding' => AudioEncoding::FLAC,
                    'sample_rate_hertz' => 32000,
                    'language_code' => 'en-US',
                  //  'projectId' => $projectId
                ]);

            # Instantiates a client
                $client = new SpeechClient([
                    'credentials' => '/var/www/html/step-app/Google-Api-Stagings-2fa417dce920.json'
                ]);

        # Detects speech in the audio file
                $response = $client->recognize($config, $audio);

        # Print most likely transcription
                foreach ($response->getResults() as $result) {
                    $alternatives = $result->getAlternatives();
                    $mostLikely = $alternatives[0];
                    $transcript = $mostLikely->getTranscript();
                    printf('Transcript: %s' . PHP_EOL, $transcript);
                }

                $client->close();
    }


}