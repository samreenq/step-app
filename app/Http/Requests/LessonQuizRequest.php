<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class LessonQuizRequest extends FormRequest
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
          //  'correct[]' => "required|array",
           // 'option[]' => "required|array|min:2",
            'question' => 'required|unique:lesson_quiz,question,NULL,id,deleted_at,'.$this->lesson_id.',lesson_id|max:255',
            'lesson_id' => 'required|exists:lessons,id'
        ];
    }

    public function messages()
    {
        return [
           // 'option[].required' => 'Minimum 2 options are required',
           // 'correct[].required'  => 'Please select the correct option',
        ];
    }
}
