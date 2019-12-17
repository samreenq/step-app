<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreQuestion extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'correct' => 'required|numeric',
            'option[]' => 'array|between:2,5',
            'question' => 'required|unique:quizzes|max:255',
            'topic_id' => 'required|exists:topics,id'
        ];
    }

    public function messages()
    {
        return [
            'option[].required' => 'Minimum 2 options are required',
            'correct.required'  => 'Please select the correct option',
        ];
    }
}
