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
    public function __construct()
    {
        //set_time_limit(0);
    }

    public function index()
    {

        # The name of the audio file to transcribe
         $audioFile = '/var/www/html/step-app/audio-english.flac';
       //$audioFile = '/var/www/html/step-app/media.io_audio-english-ww.flac';

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
                   // 'encoding' => AudioEncoding::LINEAR16,
                   // 'sample_rate_hertz' => 48000,
                    'language_code' => 'en-US',
                   // 'audio_channel_count'=> 2,
                    "enable_word_time_offsets" => true,
                    'enable_separate_recognition_per_channel'=> true,
                  //  'projectId' => $projectId
                ]);

            # Instantiates a client
                $client = new SpeechClient([
                    'credentials' => '/var/www/html/step-app/Google-Api-Stagings-2fa417dce920.json'
                ]);

        # Detects speech in the audio file
                $response = $client->recognize($config, $audio);

        # Print most likely transcription
                $full_text = '';
                foreach ($response->getResults() as $result) {
                    $alternatives = $result->getAlternatives();
                    $mostLikely = $alternatives[0];
                    $transcript = $mostLikely->getTranscript();

                    $full_text .= $transcript;
                    printf('Transcript: %s' . PHP_EOL, $transcript);
                }

                echo '<br>Full Text<br>';
                echo $full_text;

                $client->close();
    }

    public function test()
    {

        /** Uncomment and populate these variables in your code */
// $uri = 'The Cloud Storage object to transcribe (gs://your-bucket-name/your-object-name)';
        $uri = '/var/www/html/step-app/audio-english.flac'; //1 minut audio
       // $uri = '/var/www/html/step-app/media.io_audio-english-ww.flac'; //more than 1 min audio

        # get contents of a file into a string
        $content = file_get_contents($uri);

// change these variables if necessary
        $encoding = AudioEncoding::FLAC;
        $sampleRateHertz = 44100;
        $languageCode = 'en-US';

// set string as audio content
        $audio = (new RecognitionAudio())
            //->setUri($uri);
        ->setContent($content);

// set config
        $config = (new RecognitionConfig())
            ->setEncoding($encoding)
           // ->setSampleRateHertz($sampleRateHertz)
            ->setLanguageCode($languageCode)
       // ->setAudioChannelCount(2)
        ->setEnableWordTimeOffsets(true)
            ->setEnableSeparateRecognitionPerChannel(true);

// create the speech client
       // $client = new SpeechClient();
        # Instantiates a client
        $client = new SpeechClient([
            'credentials' => '/var/www/html/step-app/Google-Api-Stagings-2fa417dce920.json'
        ]);

// create the asyncronous recognize operation
        $operation = $client->longRunningRecognize($config, $audio);
        $operation->pollUntilComplete();

        if ($operation->operationSucceeded()) {
            $response = $operation->getResult();

            // each result is for a consecutive portion of the audio. iterate
            // through them to get the transcripts for the entire audio file.
            $full_text = '';
            foreach ($response->getResults() as $result) {
                $alternatives = $result->getAlternatives();
                $mostLikely = $alternatives[0];
                $transcript = $mostLikely->getTranscript();
                $confidence = $mostLikely->getConfidence();

                $full_text .= $transcript;
                printf('Transcript: %s' . PHP_EOL, $transcript);
                printf('Confidence: %s' . PHP_EOL, $confidence);
            }

            echo '<br>Full Text<br>';
            echo $full_text;

        } else {
            print_r($operation->getError());
        }

        $client->close();
    }


}